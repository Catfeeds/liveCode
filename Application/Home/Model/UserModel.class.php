<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Home\Model;
use Think\Model;
use Think\Verify;

/**
 * 用户模型
 * 
 */
class UserModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'admin_user';

    /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        //验证用户名
        //array('nickname', 'require', '昵称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),

        //验证用户名
        array('username', 'require', '用户名不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('username', '3,32', '用户名长度为1-32个字符', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
        array('username', '', '用户名被占用', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
        array('username', '/^(?!_)(?!\d)(?!.*?_$)[\w\一-\龥]+$/', '用户名只可含有数字、字母、下划线且不以下划线开头结尾，不以数字开头！', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),

        //验证密码
        array('password', 'require', '密码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('password', '6,30', '密码长度为6-30位', self::MUST_VALIDATE, 'length', self::MODEL_INSERT),
        array('password', '/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+)$)^[\w~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+$/', '密码至少由数字、字符、特殊字符三种中的两种组成', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('repassword', 'password', '两次输入的密码不一致', self::EXISTS_VALIDATE, 'confirm', self::MODEL_INSERT),

        //验证密码
        array('password', 'require', '密码不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_UPDATE),
        array('password', '6,30', '密码长度为6-30位', self::EXISTS_VALIDATE, 'length', self::MODEL_UPDATE),
        array('password', '/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+)$)^[\w~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+$/', '密码至少由数字、字符、特殊字符三种中的两种组成', self::EXISTS_VALIDATE, 'regex', self::MODEL_UPDATE),
        array('repassword', 'password', '两次输入的密码不一致', self::EXISTS_VALIDATE, 'confirm', self::MODEL_UPDATE),

        //验证邮箱
        array('email', 'email', '邮箱格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
        array('email', '1,32', '邮箱长度为1-32个字符', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
        array('email', '', '邮箱被占用', self::EXISTS_VALIDATE, 'unique', self::MODEL_BOTH),

        //验证手机号码
        //array('mobile', '/^1\d{10}$/', '手机号码格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
       // array('mobile', '', '手机号被占用', self::EXISTS_VALIDATE, 'unique', self::MODEL_BOTH),

        // 验证注册来源
        array('reg_type', 'require', '注册来源不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
    );

    /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('score', '0', self::MODEL_INSERT),
        array('money', '0', self::MODEL_INSERT),
        array('reg_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
        array('password', 'user_md5', self::MODEL_BOTH, 'function'),
        array('password', '', 2, 'ignore'),
       // array('password', 'user_md5', self::MODEL_INSERT, 'function'),
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('update_time', 'time', self::MODEL_BOTH, 'function'),
        array('status', '1', self::MODEL_INSERT),
    );

    /**
     * 用户登录
     * 
     */
    public function login($username, $password, $map) {
        $username = trim($username);
        //匹配登录方式
        if (preg_match("/^[0-9a-zA-Z]+(?:[_-][a-z0-9-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*.[a-zA-Z]+$/i", $username)) {
            $map['email'] = array('eq', $username);     // 邮箱登陆
        } elseif (preg_match("/^1\d{10}$/", $username)) {
            $map['mobile'] = array('eq', $username);    // 手机号登陆
        }else{
            $this->error = '请输入正确的手机号或邮箱！';
            return false;
        }
        if (empty($password)) {
            $this->error = '请输入密码！';
            return false;
        }
        $map['status']      = array('eq', 1);
        $map['user_type']   = array('eq', 2);
        $user_info = $this->where($map)->find(); //查找用户
        if (!$user_info) {
            $this->error = '用户不存在或被禁用！';
        } else {
            if (user_md5($password) !== $user_info['password']) {
                $this->error = '密码错误！';
            } else {
                return $user_info;
            }
        }
        return false;
    }

    /**
     * 设置登录状态
     * 
     */
    public function auto_login($user) {
        // 记录登录SESSION和COOKIES
        $auth = array(
            'uid'      => $user['id'],
            'username' => $user['username'],
            'user_type'=> $user['user_type'],
        );         
        session('user_auth', $auth);
        session('user_auth_sign', $this->data_auth_sign($auth));
        unset($_SESSION['OC_Admin_']);
        return $this->is_login();
    }

    /**
     * 数据签名认证
     * @param  array  $data 被认证的数据
     * @return string       签名
     * 
     */
    public function data_auth_sign($data) {
        // 数据类型检测
        if (!is_array($data)) {
            $data = (array)$data;
        }
        ksort($data); //排序
        $code = http_build_query($data); // url编码并生成query字符串
        $sign = sha1($code);  // 生成签名
        return $sign;
    }

    /**
     * 检测用户是否登录
     * @return integer 0-未登录，大于0-当前登录用户ID
     * 
     */
    public function is_login() {
        $user = session('user_auth');
        if (empty($user)) {
            return 0;
        } else {
            if (session('user_auth_sign') == $this->data_auth_sign($user)) {
                return $user['uid'];
            } else {
                return 0;
            }
        }
    }

    /**
     * 获取用户信息(手机号/邮件/用户id)
     * 
     */
    public function getUserInfoByParam($param) {
        if (preg_match("/^[0-9a-zA-Z]+(?:[_-][a-z0-9-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*.[a-zA-Z]+$/i", $param)) {
            $map['email'] = array('eq', $param);     // 邮箱
        } elseif (preg_match("/^1\d{10}$/", $param)) {
            $map['mobile'] = array('eq', $param);    // 手机号
        }elseif (is_int($param)) {
            $map['id'] = array('eq', $param);    // 用户id
        }else{
            $this->error = '输入不正确！';
            return false;
        }
        $map['user_type']   = array('eq', 2);
        $user_info = $this->where($map)->find(); //查找用户
        if (!$user_info) {
            $this->error = '用户不存在！';return false;
        }
        return $user_info;
    }

    /**
     * 找回密码
     * 
     */
    public function updatePass($email, $emailVerify,$password,$rePassword,$picVerify) {
        if (!preg_match("/^[0-9a-zA-Z]+(?:[_-][a-z0-9-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*.[a-zA-Z]+$/i", $email)) {
            $this->error = '请输入正确的邮箱！';return false;
        }
        if (empty($emailVerify)) {
            $this->error = '请输入邮箱验证码！';return false;
        }
        if (!preg_match("/^(?![^a-zA-Z]+$)(?!\D+$).{8,15}$/", $password)) {
            $this->error = '密码必须为8-20位，且包含字母和数字！';return false;
        }
        if (empty($rePassword)) {
            $this->error = '请输入确认密码！';return false;
        }
        if ($password != $rePassword) {
            $this->error = '两次输入的密码不一致！';return false;
        }
        $verify = new Verify();
        if (!$verify->check($picVerify, 1)) {
            $this->error = '图片验证码不正确！';return false;
        }
        if ($email !=session('email.val') || $emailVerify != session("email.key")) {
            $this->error = '邮箱验证码不正确！';return false;
        }

        $user_info = $this->where(['email'=>$email,'user_type'=>2,'status'=>1])->find(); //查找用户
        if (!$user_info) {
            $this->error = '用户不存在或被禁用！';return false;
        } else {
            $res = $this->where(['id'=>$user_info['id']])->save(['password'=>user_md5($password)]);
        }
        return $res;
    }

    /**
     * 注册
     * 
     */
    public function regist() {
        $data['username']       = trim(I('username/s'));
        $data['mobile']         = trim(I('mobile/s'));
        $data['email']          = trim(I('email/s'));
        $emailVerify            = I('emailVerify/s');
        $password               = trim(I('password/s'));
        $rePassword             = trim(I('rePassword/s'));
        $picVerify              = I('picVerify/s');

        if (empty($data['username'])) {
            $this->error = '请输入用户名！';return false;
        }
        if (!preg_match('/^1[34578]{1}\d{9}$/',$data['mobile'])) {
            $this->error = '请输入正确的手机号！';return false;
        }
        if (!preg_match("/^[0-9a-zA-Z]+(?:[_-][a-z0-9-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*.[a-zA-Z]+$/i", $data['email'])) {
            $this->error = '请输入正确的邮箱！';
            return false;
        }
        if (empty($emailVerify)) {
            $this->error = '请输入邮箱验证码！';return false;
        }
        if (!preg_match("/^(?![^a-zA-Z]+$)(?!\D+$).{8,15}$/", $password)) {
            $this->error = '密码必须为8-20位，且包含字母和数字！';return false;
        }
        if (empty($rePassword)) {
            $this->error = '请输入确认密码！';return false;
        }
        if ($password != $rePassword) {
            $this->error = '两次输入的密码不一致！';return false;
        }
        $verify = new Verify();
        if (!$verify->check($picVerify, 1)) {
            $this->error = '图片验证码不正确！';return false;
        }
        if ($data['email'] !=session('email.val') || $emailVerify != session("email.key")) {
            $this->error = '邮箱验证码不正确！';return false;
        }

        $users = $this->select();
        foreach ($users as $v) {
            if ($v['username']==$data['username']) {
                $this->error = '用户名已存在！';return false;
            }elseif ($v['mobile']==$data['mobile']) {
                $this->error = '手机号已存在！';return false;
            }elseif ($v['email']==$data['email']) {
                $this->error = '邮箱已存在！';return false;
            }
        }
        $data['password']       = user_md5($password);
        $data['user_type']      = 2;
        $data['create_time']    = time();
        $data['status']         = 1;
        
        return $this->add($data);
    }

}
