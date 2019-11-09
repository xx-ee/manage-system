package com.ms.service;

import com.ms.entity.Leavebill;
import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.vo.WorkFlowVo;
import org.activiti.engine.repository.ProcessDefinition;

import java.io.InputStream;
import java.util.List;

/**
 * 工作流的服务接口
 */
public interface IWorkFlowService
{
    /**
     * 查询所有的流程部署信息
     * @param vo
     * @return
     */
    DataGridView queryProcessDeploy(WorkFlowVo vo);

    /**
     * 查询所有的流程定义信息
     * @param vo
     * @return
     */
    DataGridView queryProcessDefinition(WorkFlowVo vo);


    /**
     * 删除流程部署
     * @param id
     */
    void deleteProcessDeployById(Integer id);

    /**
     * 查询流程模型
     * @param vo
     * @return
     */
    DataGridView queryProcessModel(WorkFlowVo vo);

    /**
     * 删除流程模型
     * @param id
     */
    void deleteProcessModelById(Integer id);

    /**
     * 发布模型为流程定义
     * @param id
     */
    ResultObj deployModel(String id);

    /**
     * 在线设计模型
     * @return
     */
    DataGridView onlineModel();

    /**
     * 查看流程图片
     * @param deploymentId
     * @return
     */
    InputStream viewProcessImage(String deploymentId);

    /**
     * 启动请假工作流
     * @param leaveBillId
     */
    ResultObj startProcess(String leaveBillId);

    /**
     * 查询用户的代办任务
     * @param vo
     * @return
     */
    DataGridView loadCurrentUserTask(WorkFlowVo vo);

    /**
     * 根据任务ID查询请假单的信息
     * @param taskId
     * @return
     */
    Leavebill queryLeaveBillByTaskId(String taskId);

    /**
     * 根据任务id查询连线信息
     * @param taskId
     * @return
     */
    List<String> queryOutComeByTaskId(String taskId);

    /**
     * 根据任务ID查询批注信息
     * @param taskId
     * @return
     */
    DataGridView queryCommentsByTaskId(String taskId);

    /**
     * 完成任务
     * @param vo
     * @return
     */
    ResultObj completeTask(WorkFlowVo vo);

    /**
     * 根据任务Id查询流程实例
     * @param taskId
     * @return
     */
    ProcessDefinition queryProcessDefinitionByTaskId(String taskId);

    InputStream viewTaskProcessImageByTaskId(String taskId);

    /**
     * 根据请假单ID查询审批信息
     */
    DataGridView queryCommentsByLeaveBillId(String id);

    /**
     * 查询当前用户的审批记录
     * @param vo
     * @return
     */
    DataGridView queryCurrentUserHistoryTask(WorkFlowVo vo);
}
