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
class AccountModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'admin_user';

    /**
     * 密码修改
     * 
     */
    public function editpass($data) {
            $user_info = $this->where(['id'=>session('user_auth.uid'),'user_type'=>2,'status'=>1])->find();
            if (user_md5($data['password']) != $user_info['password']) {
                $this->error = '原始密码错误！';return false;
            }
            if (!preg_match("/^(?![^a-zA-Z]+$)(?!\D+$).{8,15}$/", $data['password1'])) {
                $this->error = '新密码必须为8-20位，且包含字母和数字！';return false;
            }
            if (empty($data['password2'])) {
                $this->error = '请输入确认密码！';return false;
            }
            if ($data['password1'] != $data['password2']) {
                $this->error = '两次输入的密码不一致！';return false;
            }

            $result = $this->where(['id'=>session('user_auth.uid'),'user_type'=>2,'status'=>1])->save(['password'=>user_md5($data['password1'])]);
            
            return $result;
    }


}
