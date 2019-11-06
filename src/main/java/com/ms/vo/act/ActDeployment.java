package com.ms.vo.act;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.activiti.engine.impl.persistence.entity.ResourceEntity;
import org.activiti.engine.repository.Deployment;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Classname： ActDeployment
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/6 17:10
 * @Version： 1.0
 **/
@Data
@EqualsAndHashCode(callSuper=false)
public class ActDeployment implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String name;
    private String category;
    protected String tenantId = "";
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date deploymentTime;
    public ActDeployment(Deployment deployment) {
        setId(deployment.getId());
        setName(deployment.getName());
        setDeploymentTime(deployment.getDeploymentTime());
        setCategory(deployment.getCategory());
        setTenantId(deployment.getTenantId());
    }
}
