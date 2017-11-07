<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Model;
use Think\Model;
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
        array('username', 'require', '用户名不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('username', '1,10', '用户名请勿超过10个字符', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
        array('username', '', '用户名被占用', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
        // array('username', '/^(?!_)(?!\d)(?!.*?_$)[\w\一-\龥]+$/', '用户名只可含有数字、字母、下划线且不以下划线开头结尾，不以数字开头！', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),

        //验证密码
        array('password', 'require', '密码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('password', '8,20', '密码长度为8-20位', self::MUST_VALIDATE, 'length', self::MODEL_INSERT),
        array('password', '/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+)$)^[\w~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+$/', '密码至少由数字、字符、特殊字符三种中的两种组成', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('repassword', 'password', '两次输入的密码不一致', self::EXISTS_VALIDATE, 'confirm', self::MODEL_INSERT),

        //验证密码
        array('password', 'require', '密码不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_UPDATE),
        array('password', '8,20', '密码长度为8-20位', self::EXISTS_VALIDATE, 'length', self::MODEL_UPDATE),
        array('password', '/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+)$)^[\w~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+$/', '密码至少由数字、字符、特殊字符三种中的两种组成', self::EXISTS_VALIDATE, 'regex', self::MODEL_UPDATE),
        array('repassword', 'password', '两次输入的密码不一致', self::EXISTS_VALIDATE, 'confirm', self::MODEL_UPDATE),

        //验证手机号码
        array('mobile', '/^1\d{10}$/', '手机号码格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
        array('mobile', '', '手机号被占用', self::EXISTS_VALIDATE, 'unique', self::MODEL_BOTH),

        //验证邮箱
        array('email', 'email', '邮箱格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
        array('email', '1,32', '邮箱长度为1-32个字符', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
        array('email', '', '邮箱被占用', self::EXISTS_VALIDATE, 'unique', self::MODEL_BOTH),

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
        //去除前后空格
        $username = trim($username);

        //匹配登录方式
        if (preg_match("/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/", $username)) {
            $map['email'] = array('eq', $username);     // 邮箱登陆
        } elseif (preg_match("/^1\d{10}$/", $username)) {
            $map['mobile'] = array('eq', $username);    // 手机号登陆
        } else {
            $map['username'] = array('eq', $username);  // 用户名登陆
        }

        $map['status']   = array('eq', 1);
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
        unset($_SESSION['OC_Home_']);
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
        $user = $_SESSION["OC_Home_"]["user_auth"] ? $_SESSION["OC_Home_"]["user_auth"] : $_SESSION["OC_Admin_"]["user_auth"];
        session('user_auth', $user);
        if (!$user) {
            return 0;
        }else{
            return $user['uid'];
        }
        // $user = session('user_auth');
        // if (empty($user)) {
        //     return 0;
        // } else {
        //     if (session('user_auth_sign') == $this->data_auth_sign($user)) {
        //         return $user['uid'];
        //     } else {
        //         return 0;
        //     }
        // }
    }

    /**
     * 根据用户id获取用户信息
     */
    public function getUserInfo($uid){
        $user = $this->where(['id'=>$uid])->find();
        return $user;
    }
    /**
     * 获取待审核活码域名的用户数量
     */
    public function getIfCheckCount(){
        $count = $this->where(['url'=>['neq',''],'url_status'=>0])->count();
        return $count;
    }
    /**
     * 检查用户功能权限
     * 
     */
    public function checkMenuAuth() {
        $current_menu = D('Admin/Module')->getCurrentMenu(); // 当前菜单
        $user = $this->alias('u')->field('v.menu_auth')->join('__VIP__ v on u.vipId=v.id')->where('u.id='.session('user_auth.uid'))->find();
        $menu_auth = json_decode($user['menu_auth'],true);
        if ($menu_auth != '') {
            // 获得当前登录用户所属部门的权限列表
            if (!in_array($current_menu['id'], $menu_auth) && !in_array($current_menu['pid'], $menu_auth)) {
                return true;
            }
        } else {
            return true;  // 无需验证
        }
        return false;
    }

}
