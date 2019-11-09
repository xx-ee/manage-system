package com.ms.vo.act;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.activiti.engine.task.Task;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper=false)
public class TaskEntityVo {
    private String id;
    private String name;
    private String assignee;
    private String processInstanceId;
    private String executionId;
    private String processDefinitionId;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;

    public TaskEntityVo(Task taskEntity){
        setId(taskEntity.getId());
        setName(taskEntity.getName());
        setAssignee(taskEntity.getAssignee());
        setCreateTime(taskEntity.getCreateTime());
        setProcessDefinitionId(taskEntity.getProcessDefinitionId());
        setExecutionId(taskEntity.getExecutionId());
        setProcessInstanceId(taskEntity.getProcessInstanceId());
    }
    public TaskEntityVo(){}

    public TaskEntityVo(String id, String name, String assignee, String processInstanceId, String executionId, String processDefinitionId, Date createTime) {
        this.id = id;
        this.name = name;
        this.assignee = assignee;
        this.processInstanceId = processInstanceId;
        this.executionId = executionId;
        this.processDefinitionId = processDefinitionId;
        this.createTime = createTime;
    }
}
