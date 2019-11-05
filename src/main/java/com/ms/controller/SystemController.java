package com.ms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Classname： SystemController
 * @Description：系统前端控制器
 * @Author： xiedong
 * @Date： 2019/11/5 9:17
 * @Version： 1.0
 **/
@Controller
@RequestMapping("sys")
public class SystemController
{
    /**
     *跳转到登录页面
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin()
    {
        return "system/index/login";
    }

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping("index")
    public String toIndex()
    {
        return "system/index/index";
    }
}
