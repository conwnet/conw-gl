<?php
namespace app\index\controller;
use app\index\model;
use think\Controller;

class Admin extends Permission {
    public function index() {

        $this->assign('nickname', model\User::get(input('session.id'))->nickname);
        $this->assign('username', model\User::get(input('session.id'))->username);
        return $this->fetch('index');
    }

    public function welcome() {
        return $this->fetch('welcome');
    }

    public function platform_manage() {
        return $this->fetch('platform_manage');
    }

    public function platform_add() {
        if(request()->isPost()) {
            foreach ($_POST as $key => $value) {
                if(is_array($value))
                    $_POST[$key] = json_encode($value);
            }
            $platform = model\Platform::get(input('post.id'));
            if($platform == NULL) {
                unset($_POST['id']);
                (new Platform())->save($_POST);
                $this->success('添加成功！', url('admin/index'));
            } else {
                $platform->save($_POST);
                $this->success('更新成功！', url('admin/index'));
            }

        } else {
            return $this->error('访问出错', url('admin/platform'));
        }
    }

    public function platform($id = 0)
    {
        $platform = model\Platform::get($id);
        if ($platform != NULL) {
            $platform = $platform->getData();
            foreach ($platform as $key => $value) {
                $data = json_decode($value);
                if ($data != NULL)
                    $platform[$key] = $data;}
            $this->assign('info', $platform);
        }
        return $this->fetch('platform');
    }

}