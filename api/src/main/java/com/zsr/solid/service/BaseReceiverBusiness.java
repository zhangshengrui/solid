package com.zsr.solid.service;

import com.zsr.solid.entity.BaseReceiver;
import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.ResponseTable;

public interface BaseReceiverBusiness {
    ResponseTable querySupplierList(BaseReceiver baseReceiver);     //查询
    String operate(BaseReceiver baseReceiver);                      //更改状态
    String editSupplier(BaseReceiver baseReceiver);                 //新增修改
    String delete(String password, String ids);                      //删除ID
}
