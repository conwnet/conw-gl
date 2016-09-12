<?php
/**
 * Created by PhpStorm.
 * account: root
 * Date: 16-8-13
 * Time: 下午12:07
 */
namespace app\index\controller;
use think\Controller;


class Statistics extends Permission {

    public function index(){
        //默认打开的统计页面
//        get the infomation
        //total_school total_plat total_respo  total_direction total_first  total_second
        return $this->fetch('index');


    }



    public function search(){

        return $this->fetch('search');

    }

}
