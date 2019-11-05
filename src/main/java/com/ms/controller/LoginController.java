package com.ms.controller;

import com.ms.common.ActiverUser;
import com.ms.response.ResultObj;
import com.ms.utils.WebUtils;
import com.ms.entity.Loginfo;
import com.ms.service.ILoginfoService;
import com.ms.utils.CommonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @Classname： LoginController
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/5 9:23
 * @Version： 1.0
 **/
@RestController
@RequestMapping("login")
@Slf4j
public class LoginController
{
    @Autowired
    private ILoginfoService loginfoService;

    @RequestMapping("login")
    public ResultObj login(String loginname,String pwd)
    {
        //获取主体
        Subject subject = SecurityUtils.getSubject();
        //生成令牌
        AuthenticationToken token = new UsernamePasswordToken(loginname, pwd);
        try 
        {
            subject.login(token);
            ActiverUser activerUser = (ActiverUser)subject.getPrincipal();
            WebUtils.getSession().setAttribute("user", activerUser.getUser());
            //记录登录日志
            Loginfo loginfo = new Loginfo();
            loginfo.setLoginname(activerUser.getUser().getName()+"-"+activerUser.getUser().getLoginname());
            loginfo.setLoginip(CommonUtil.getLocalIp());
            loginfo.setLogintime(new Date());
            loginfoService.save(loginfo);
            return ResultObj.LOGIN_SUCCESS;
        } catch (AuthenticationException e) {
            log.info("登录出现异常",e);
            return ResultObj.LOGIN_ERROR_PASS;
        }
    }
}
