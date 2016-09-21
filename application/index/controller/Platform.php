<?php
namespace app\index\controller;
use app\index\model;
use think\Controller;
use think\Session;

class Platform extends Permission {

    //Platfrom list
    public function manage()
    {
        if(input('post.cate')) {
            switch (input('post.cate')) {
                case 1:
                    $data = model\Platform::field(['id', 'platform_name', 'submit_user_id', 'update_time', 'status'])
                        ->where('platform_name', 'like', '%' . input('post.cvalue') . '%')->limit(10)->select(); break;
                case 2:
                    $data = model\Platform::field(['id', 'platform_name', 'submit_user_id', 'update_time', 'status'])
                        ->where('school_name', 'like', '%' . input('post.cvalue') . '%')->limit(10)->select(); break;
                case 3: $data = model\Platform::field(['id', 'platform_name', 'submit_user_id', 'update_time', 'status'])
                        ->where('research_direction', 'like', '%' . input('post.cvalue') . '%')->limit(10)->select(); break;
            }
        } else {
            $data = model\Platform::field(['id', 'platform_name', 'submit_user_id', 'update_time', 'status'])->limit(10)->select();
        }
        foreach ($data as $key => $value) {
            $data[$key] = $value->getData();
            $user = model\User::get($value['submit_user_id']);
            $data[$key]['username'] = $user['username'];
        }
        //return dump($data);
        $this->assign('data', $data);
        return $this->fetch('manage');
    }

    public function update() {
        if(request()->isPost()) {
            foreach($_POST as $key => $value) {
                if(is_array($value))
                    $_POST[$key] = json_encode($value);
            }
            $_POST['update_time'] = time();
            $_POST['submit_user_id'] = Session::get('id');
            $platform = (new model\Platform())->where('id', $_POST['id'])->find();
            if($platform == NULL) {
                unset($_POST['id']);
                (new model\Platform())->save($_POST);
                $this->success('添加成功！', url('platform/manage'));
            } else {
                $platform->save($_POST);
                $this->success('更新成功！', url('platform/manage'));
            }

        } else {
            return $this->error('访问出错', url('platform/manage'));
        }
    }

    public function show($id = 0)
    {
        $info = model\Platform::get($id);
        if ($info != NULL) {
            $info = $info->getData();
            foreach($info as $key => $value) {
                $data = json_decode($value);
                if ($data != NULL)
                    $info[$key] = $data;}
            $this->assign('id', $id);
            $this->assign('info', $info);
        }
        return $this->fetch('show');
    }

    public function operate() {
        $id = input('post.id');
        $operation = input('post.operation');
        $platform = model\Platform::get($id);
        if($platform == NULL) return ;
        if($operation == 1) {
            $platform->save(['status' => 1]);
        } else if($operation == 2) {
            $platform->save(['status' => 2]);
        } else if($operation == 3){
            $platform->delete();
        }
        return true;
    }

}