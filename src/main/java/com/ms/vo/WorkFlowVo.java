package com.ms.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Classname： WorkFlowVo
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/6 16:31
 * @Version： 1.0
 **/
@Data
@EqualsAndHashCode(callSuper=false)
public class WorkFlowVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer[] ids;//接收多个ID
    private Integer page=1;
    private Integer limit=10;

    //流程部署名称
    private String deploymentName;

}
