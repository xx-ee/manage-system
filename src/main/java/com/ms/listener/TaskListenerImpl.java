package com.ms.listener;

import com.ms.entity.User;
import com.ms.mapper.UserMapper;
import com.ms.utils.WebUtils;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * @Classname： TaskListenerImpl
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/7 12:45
 * @Version： 1.0
 **/
public class TaskListenerImpl implements TaskListener {
    private static final long serialVersionUID = 1L;

    @Override
    public void notify(DelegateTask delegateTask) {
        // 得到IOC容器
        // ApplicationContext context=new
        // ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        WebApplicationContext springContext = WebApplicationContextUtils
                .getWebApplicationContext(WebUtils.getServletContext());
        UserMapper userMapper = springContext.getBean(UserMapper.class);
        // 得到当前用户
        User user = WebUtils.getCurrentUser();
        User temp = new User();
        temp.setId(user.getMgr());
        User leaderUser = userMapper.selectById(temp);
        // 设置下一个任务的办理人
        delegateTask.setAssignee(leaderUser.getName());
    }
}
