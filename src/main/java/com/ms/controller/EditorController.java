package com.ms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Classname： EditorController
 * @Description：工作流前端控制器
 * @Author： xiedong
 * @Date： 2019/11/5 15:48
 * @Version： 1.0
 **/
@Controller
public class EditorController {
    @GetMapping("editor")
    public String test(){
        return "activiti/modeler";
    }
}
