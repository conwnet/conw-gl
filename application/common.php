<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function password_encrypt($password)
{
    $__SALT__ = 'netcon';
    return md5($password.$__SALT__);
}



function get_power($id) {
    $role_user = app\index\model\Role_user::get(['user_id' => $id]);
    return $role_user->role_id;
}