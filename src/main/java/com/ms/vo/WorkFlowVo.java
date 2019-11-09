package com.ms.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

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

    private String[] ids;//接收多个ID
    private Integer page=1;
    private Integer limit=10;

    //模型ID
    private String modelId="";
    //模型名称
    private String modelName="";

    //流程部署名称
    private String deploymentName="";
    //流程部署ID
    private String deploymentId="";

    //流程定义ID
    private String definitionId;
    //流程定义名称
    private String definitionName;

    //请假单的ID
    private String id;

    //任务id
    private String taskId;
    //批注
    private String comment;
    //
    private String outcome;


}
