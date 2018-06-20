package com.zsr.solid.service.impl;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.entity.User;
import com.zsr.solid.mapper.AdminUserDao;
import com.zsr.solid.service.AdminUserBusiness;
import com.zsr.solid.util.MD5;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class AdminUserBusinessImpl implements AdminUserBusiness{
    @Autowired
    private AdminUserDao adminUserDao;

    @Override
    public ResponseTable querySupplierList(User user) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<User> list = adminUserDao.querySupplierList(user);
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
    @Transactional
    public String operate(User user) {
        String message = "false";
        try {
            if(user.getId() == null  || user.getStatus() == null ){
                return message;
            }
            Integer i = adminUserDao.operate(user);
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
    @Transactional
    public String editSupplier(User user) {
        try {
            if(user.getId() == null){
                    return "false";
            }
            String result;
            if(user.getId() == -1){ //新增
               Integer count =  adminUserDao.querySupplierListByName(user.getAccount()); //判断是否有重复的
               if(count> 0){
                   return "repeat";
               }
               String password = MD5.stringToMD5("admin");
               user.setPassword(password);
               user.setIndate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
               result = adminUserDao.addSupplier(user)>0?"新增":"false";
            } else{//修改
               result = adminUserDao.editSupplier(user)>0?"修改":"false";
            }
            return result;
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    @Transactional
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
            return adminUserDao.delete(idstr)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    @Transactional
    public String reset(String password, String ids) {
        try {
            if(StringUtils.isBlank(password)||StringUtils.isBlank(ids)){
                return  "password or ids is null";
            }
            if(!"123456".equals(password)){
                return "wrong";
            }
            String md5 = MD5.stringToMD5("admin");
            return adminUserDao.reset(md5,ids)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    @Transactional
    public String changeOld(String old, String password,String userId) {
        try {
            if(StringUtils.isBlank(old) || StringUtils.isBlank(password) || StringUtils.isBlank(userId)){
                return "fail";
            }
            User user = this.adminUserDao.queryUserByName(userId);
            if(user==null || StringUtils.isBlank(user.getPassword())){
                return "fail";
            }
            if(!user.getPassword().equals(MD5.stringToMD5(old))){
                return "wrong";
            }
            return adminUserDao.changeOld(MD5.stringToMD5(password),userId)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }

    }
}
