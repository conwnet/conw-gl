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
        $users = model\User::select();
        $this->assign('users', $users);
        foreach($users as $user)
            $user->company = model\Company::get($user->company)->name;
        return $this->fetch();
    }

    public function user_show($id) {
        $user = model\User::get($id);
        $roles = model\Role::select();
        $companys = model\Company::select();
        $this->assign('companys', $companys);
        $this->assign('roles', $roles);
        $this->assign('user', $user);

        return $this->fetch();
    }

    public function user_update() {
        if(input('post.password') && strlen(input('post.password')) < 3)
            return $this->error('新密码太短了！');
        if(input('post.password') && input('post.password') != input('post.repassword'))
            return $this->error('两次密码不一样！');
        $user_id = input('post.user_id');

        $user = model\User::get($user_id);
        if($user) {
            $user->info = input('post.info');
            $user->nickname = input('post.nickname');
            if(input('post.role'))
                $user->role = input('post.role');
            if(input('post.password'))
                $user->password = password_encrypt(input('post.password'));
            $user->company = input('post.company');
            $user->status = input('post.status');
            $user->save();
        }

        return $this->success('更新成功！');
    }

    public function user_operate() {
        $id = input('post.id');
        $operation = input('post.operation');
        $user = model\User::get($id);
        if($user == NULL) return false;
        if($operation == 1) {
            $user->save(['status' => 0]);
        } else if($operation == 2) {
            $user->save(['status' => 1]);
        } else if($operation == 3){
            $user->delete();
        }
        return true;
    }

    public function role() {
        $roles = model\Role::field(['id', 'name', 'status', 'remark'])->select();
        $this->assign('roles', $roles);
        return $this->fetch();
    }

    public function role_show($id) {
        $role = model\Role::get($id);
        $nodes = model\Node::select();
        $node_roles = [];
        foreach(model\Node_role::field('node_id')->where('role_id', $id)->select() as $v) {
            $node_roles[] = $v['node_id'];
        }
        $this->assign('node_roles', $node_roles);
        $this->assign('nodes', $nodes);
        $this->assign('role', $role);


        return $this->fetch();
    }

    public function role_update() {
        if(isset($_POST['power']))
            $powers = $_POST['power'];
        else
            $powers = NULL;
        $role_id = input('post.role_id');

        $role = model\Role::get($role_id);
        if($role) {
            $role->name = input('post.name');
            $role->remark = input('post.remark');
            $role->status = input('post.status');
            $role->save();
        }

        model\Node_role::where('role_id', $role_id)->delete();
        if($powers)
        foreach($powers as $v) {
            $node_role = new model\Node_role();
            $node_role->save(['role_id' => $role_id, 'node_id' => $v]);
        }

        return $this->success('更新成功！');
    }

    public function role_add() {
        $role = new model\Role();
        $role->save(['name' => '新角色', 'remark' => '新创建的角色', 'status' => 0]);
        return $this->success('添加成功！');
    }

    public function role_del() {
        $role = model\Role::get(input('post.id'));
        $role->delete();
        return true;
    }

    public function node() {
        $nodes = model\Node::field(['id', 'name', 'remark', 'status'])->select();
        $this->assign('nodes', $nodes);
        return $this->fetch();
    }

}
