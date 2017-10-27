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

/**
 * 通知类(邮件)
 * 
 */
class NoticeModel extends Model {
    private $conf = [
        'WEB_SITE'          => '爱活码',
        'title'             => '爱活码邮箱验证码提醒',
        // 'updatePassContent' => '亲,您正在进行爱活码密码找回操作，验证码为【{#验证码#}】。如非本人操作,可不用理会!',
        // 'registContent'     => '亲,您正在进行爱活码注册操作，验证码为【{#验证码#}】。如非本人操作,可不用理会!',
    ];

    public function email($email){
        $this->conf["email"] = $email;
        return $this;
    }
    
    public function send($msg_type, $tpl = null, $title = null){
        if(is_array($tpl))      $this->conf["emailTpl"]   = $tpl;
        if(is_array($title))    $this->conf['title'] = $title;
        // $status = $this->sendEmail($this->conf["title"], $this->conf[$msg_type]);
        $status = $this->sendEmail($this->conf["title"], C($msg_type));
        return $status;
    }

    /**
     * @param $title mixed   邮件的标题
     * @param $content mixed 邮件的内容
     * @param $replace array 要替换的内容
     * @param int $type mixed 1为其它邮箱服务器转发  2,自己的邮箱服务器;默认1
     * @return bool
     */
    public function sendEmail($title, $content){
        if(empty($this->conf["email"])) return false;
        if(isset($this->conf["emailTpl"])){
            $content    = $this->replace($content, $this->conf["emailTpl"]);
        }
        if(isset($this->conf["title"])){
            $title  = $this->replace($title, $this->conf["title"]);
        }

        Vendor('phpmailer.phpmailer');
        $Mail           = new \PHPMailer();

        $Mail->IsSMTP();
        $Mail->Host     = system_config("EMAIL_HOST")["value"];
        $Mail->SMTPAuth = true;     
        $Mail->Username = system_config('EMAIL_ADDR')["value"];
        $Mail->Password = system_config('EMAIL_PASS')["value"];
        $Mail->Port     = system_config('EMAIL_PORT')["value"];
        $Mail->From     = system_config('EMAIL_ADDR')["value"];
        $Mail->FromName = $this->conf["WEB_SITE"];
        $Mail->AddAddress($this->conf["email"], "尊敬的客户");
        $email_port     =  system_config('EMAIL_PORT')["value"];
        ($email_port != 25) and $Mail->SMTPSecure = 'ssl';
        $Mail->WordWrap = 50;
        $Mail->IsHTML(true);
        $Mail->CharSet  = 'UTF-8';
        $Mail->Subject  = $title;
        $Mail->Body     = $content;
        return $Mail->Send();
    }

    /**邮件能用到的替换
     * @param $content mixed 内容
     * @param $replace array 要替换的内容 是个数组
     * @return mixed 发挥处理有的内容
     */
    public function replace($content, $replace){
        if (is_array($replace)) {
            $patt = '/\{#.*?#\}/i';
            foreach ($replace as $key => $value) {
                $content = preg_replace($patt, $value, $content, 1);
            }
            return $content;
        } else {
            return $content;
        }
    }

}
