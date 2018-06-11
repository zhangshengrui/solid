package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseReceiver;
import com.zsr.solid.service.BaseReceiverBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("base/receiver")
public class BaseReceiverController {
    @Autowired
    private BaseReceiverBusiness baseReceiverBusinessImpl;

    @RequestMapping("querySupplierList")
    public String querySupplierList(BaseReceiver baseReceiver){
        return JSON.toJSONString(baseReceiverBusinessImpl.querySupplierList(baseReceiver));
    }

    @RequestMapping("operate")
    public String operate(BaseReceiver baseReceiver) {
        return baseReceiverBusinessImpl.operate(baseReceiver);
    }

    @RequestMapping("editSupplier")
    public String editSupplier(BaseReceiver baseReceiver){
        return baseReceiverBusinessImpl.editSupplier(baseReceiver);
    }

     @RequestMapping("delete")
    public String delete(String password,String ids){
        return baseReceiverBusinessImpl.delete(password,ids);
    }
}
