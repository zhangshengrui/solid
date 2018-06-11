package com.zsr.solid.service;

import com.zsr.solid.entity.BaseFleet;
import com.zsr.solid.entity.ResponseTable;

public interface BaseFleetBusiness {
    ResponseTable querySupplierList(BaseFleet baseFleet);     //查询
    String operate(BaseFleet baseFleet);                      //更改状态
    String editSupplier(BaseFleet baseFleet);                 //新增修改
    String delete(String password, String ids);                      //删除ID
}
