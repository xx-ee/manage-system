package com.ms.vo.act;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.activiti.engine.impl.form.StartFormHandler;
import org.activiti.engine.impl.task.TaskDefinition;
import org.activiti.engine.repository.ProcessDefinition;

import java.io.Serializable;
import java.util.Map;

/**
 * @Classname： ActProcessDefinition
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/6 17:22
 * @Version： 1.0
 **/
@Data
@EqualsAndHashCode(callSuper=false)
public class ActProcessDefinition implements Serializable
{
    private String id;
    private String name;
    protected String key;
    protected int version;
    protected String category;
    protected String deploymentId;
    protected String resourceName;
    protected String tenantId = "";
    protected String diagramResourceName;

    public ActProcessDefinition(ProcessDefinition processDefinition) {
        setId(processDefinition.getId());
        setName(processDefinition.getName());
        setKey(processDefinition.getKey());
        setVersion(processDefinition.getVersion());
        setCategory(processDefinition.getCategory());
        setDeploymentId(processDefinition.getDeploymentId());
        setResourceName(processDefinition.getResourceName());
        setTenantId(processDefinition.getTenantId());
        setDiagramResourceName(processDefinition.getDiagramResourceName());
    }
}
