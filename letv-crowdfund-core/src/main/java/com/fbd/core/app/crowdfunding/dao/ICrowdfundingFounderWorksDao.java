package com.fbd.core.app.crowdfunding.dao;

import java.util.List;
import com.fbd.core.app.crowdfunding.model.CrowdfundingFounderWorksModel;
import com.fbd.core.base.BaseDao;

public interface ICrowdfundingFounderWorksDao extends BaseDao<CrowdfundingFounderWorksModel>{
    
    /**
     * 根据领导人id删除列表
     * Description: 
     * @param 
     * @return void
     * @throws 
     * Create Date: 2016-8-11 下午12:37:59
     */
    public void deleteByFounderId(String founderId);
    
    /**
     * 查询列表
     */
    public List<CrowdfundingFounderWorksModel> selectList(CrowdfundingFounderWorksModel model);
}