<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\User;
use think\View;
use think\Session;
use think\Validate;

class Index extends Controller
{

    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub

    }

    public function index()
    {
        return $this->fetch();
    }

    public function check()
    {
        $validate = new Validate([
            'username' => 'require|min:3|max:30',
            'password' => 'require|min:3|max:127'
        ]);
        if($validate->check($_POST)) {
            $user = User::get(['username'=>input('post.username')]);
            if ($user == NULL)
                return $this->error('帐号不存在！', url('index/index'));
            if(password_encrypt(input('post.password')) == $user->password) {
                Session::set('id', $user->id);
                Session::set('login_ip', $user->login_ip);
                Session::set('login_time', $user->login_time);
                Session::set('login_times', $user->login_times + 1);
                $user->save(['login_ip' => input('server.remote_addr'),
                            'login_time' => time(),
                            'login_times' => ($user->login_times + 1)]);
                return $this->success('登录成功！', url('admin/index'));
            } else {
                return $this->error('密码错误！', url('index/index'));
            }
        } else {
            return $this->error('帐号密码输入不合法！', url('index/index'));
        }
    }

    public function logout() {
        Session::set('id', 0);
        $this->success('注销成功！', url('index/index'));
    }
}
