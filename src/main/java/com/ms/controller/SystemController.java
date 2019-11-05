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
    /**
     * 跳转到工作台
     */
    @RequestMapping("toDeskManager")
    public String toDeskManager() {
        return "system/index/deskManager";
    }
    /**
     * 跳转到日志管理
     *
     */
    @RequestMapping("toLoginfoManager")
    public String toLoginfoManager() {
        return "system/loginfo/loginfoManager";
    }
    /**
     * 跳转到公告管理
     *
     */
    @RequestMapping("toNoticeManager")
    public String toNoticeManager() {
        return "system/notice/noticeManager";
    }
    /**
     * 跳转到部门管理
     *
     */
    @RequestMapping("toDeptManager")
    public String toDeptManager() {
        return "system/dept/deptManager";
    }
    /**
     * 跳转到部门管理-left
     *
     */
    @RequestMapping("toDeptLeft")
    public String toDeptLeft() {
        return "system/dept/deptLeft";
    }


    /**
     * 跳转到部门管理--right
     *
     */
    @RequestMapping("toDeptRight")
    public String toDeptRight() {
        return "system/dept/deptRight";
    }


}
