<?php
namespace app\index\controller;
use think\Controller;
use app\index\model;
use think\View;
use think\Session;
use think\Validate;

class Account extends Permission
{

    public function user() {
        $user = model\User::field(['id', 'username', 'nickname', 'company', 'create_time', 'status'])->limit(10)->select();
        $this->assign('user', $user);
        return $this->fetch();
    }

    public function role() {
        return $this->fetch();
    }

    public function node() {
        return $this->fetch();
    }

}
