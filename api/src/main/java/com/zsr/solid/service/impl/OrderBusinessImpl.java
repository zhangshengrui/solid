package com.zsr.solid.service.impl;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.Order;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.OrderDao;
import com.zsr.solid.service.OrderBusiness;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderBusinessImpl implements OrderBusiness{
    @Autowired
    private OrderDao orderDao;

    @Override
    public ResponseTable querySupplierList(Order order) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<BaseSupplier> list = orderDao.querySupplierList(order);
            responseTable.setData(list);
            responseTable.setRecordsFiltered(list.size());
            responseTable.setRecordsTotal(list.size());
            return responseTable;
        }catch (Exception e){
            e.printStackTrace();
            responseTable.setData(new ArrayList());
            responseTable.setRecordsFiltered(0);
            responseTable.setRecordsTotal(0);
            return responseTable;
        }
    }

    @Override
    public String operate(Order order) {
        String message = "false";
        try {
            if(order.getId() == null  || order.getStatus() == null ){
                return message;
            }
            Integer i = orderDao.operate(order);
            if(i > 0){
                message = "success";
            }
            return  message;
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    public String editSupplier(Order order) {
        try {
            if(order.getId() == null){
                    return "false";
            }
            String result;
            if(order.getId() == -1){ //新增
               order.setIndate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
               result = orderDao.addSupplier(order)>0?"新增":"false";
            } else{//修改
               result = orderDao.editSupplier(order)>0?"修改":"false";
            }
            return result;
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    public String delete(String password, String ids) {
        try {
            if(StringUtils.isBlank(password)||StringUtils.isBlank(ids)){
                return  "password or ids is null";
            }
            if(!"123456".equals(password)){
                return "wrong";
            }
            if(!ids.contains("[") && !ids.contains("]")){
                    ids = "[" + ids + "]";
            }
            List<Integer> list = JSON.parseObject(ids,new ArrayList().getClass());
            String idstr = "( "+StringUtils.join(list,",")+" )";
            return orderDao.delete(idstr)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

}
