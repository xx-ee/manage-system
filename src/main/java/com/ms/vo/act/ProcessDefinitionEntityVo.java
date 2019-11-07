package com.ms.vo.act;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.activiti.engine.repository.ProcessDefinition;

/**
 * @Classname： ProcessDefinitionEntityVo
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/7 10:38
 * @Version： 1.0
 **/
@Data
@EqualsAndHashCode(callSuper=false)
public class ProcessDefinitionEntityVo {
    private String id;
    private String name;
    protected String key;
    protected int version;
    protected String category;
    protected String deploymentId;
    protected String resourceName;
    protected String tenantId = "";
    protected String diagramResourceName;

    public ProcessDefinitionEntityVo(ProcessDefinition processDefinition) {
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
