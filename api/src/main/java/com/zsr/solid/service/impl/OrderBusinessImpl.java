package com.zsr.solid.service.impl;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.Journal;
import com.zsr.solid.entity.Order;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.JournalDao;
import com.zsr.solid.mapper.OrderDao;
import com.zsr.solid.mapper.PasswordDao;
import com.zsr.solid.service.OrderBusiness;
import com.zsr.solid.util.MD5;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class OrderBusinessImpl implements OrderBusiness{
    @Autowired
    private OrderDao orderDao;

    @Autowired
    private JournalDao journalDao;

    @Autowired
    private PasswordDao passwordDao;

    @Override
    public ResponseTable querySupplierList(Order order) {
        ResponseTable responseTable = new ResponseTable();
        try {
            List<Order> list = orderDao.querySupplierList(order);
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
    @Transactional
    public String editSupplier(String name,Order order) {
        try {
            if(order.getId() == null){
                    return "false";
            }
            String result;
            order.setGoodsCount(new Float(order.getGoodsCount()).toString());
            order.setGoodsPrice(new Float(order.getGoodsPrice()).toString());
            order.setGoodsMoney(new Float(order.getGoodsMoney()).toString());
            order.setReceiverCount(new Float(order.getReceiverCount()).toString());
            order.setReceiverPrice(new Float(order.getReceiverPrice()).toString());
            order.setReceiverMoney(new Float(order.getReceiverMoney()).toString());
            order.setProfit(new Float(order.getProfit()).toString());
            order.setCompany(new Float(order.getCompany()).toString());
            order.setTonnage(new Float(order.getTonnage()).toString());
            order.setConversion(new Float(order.getConversion()).toString());
            if(order.getId() == -1){ //新增
               order.setIndate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
               order.setStatus(0);
               result = orderDao.addSupplier(order)>0?"新增":"false";

               String content = order.toString();
               Journal j = new Journal();
               j.setContent(content);
               j.setPerson(name);
               j.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
               j.setType("新增订单");
               journalDao.insertLog(j);
            } else{//修改
               Order o = new Order();
               o.setId(order.getId());
               List<Order> l = orderDao.querySupplierList(o);
               if(l.size() == 1){
                   String content = "旧订单:" + l.get(0).toString() + "<br><br>" + "新订单:" + order.toString();
                   Journal j = new Journal();
                   j.setContent(content);
                   j.setPerson(name);
                   j.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                   j.setType("修改订单");
                   journalDao.insertLog(j);
               }
               result = orderDao.editSupplier(order)>0?"修改":"false";
            }
            return result;
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    @Transactional
    public String delete(String name,String password, String ids) {
        try {
            if(StringUtils.isBlank(password)||StringUtils.isBlank(ids)){
                return  "password or ids is null";
            }
            String pwd = passwordDao.queryPasswordById(5);//车队
            if(!pwd.equals(MD5.stringToMD5(password))){
                return "wrong";
            }

            List<String> list = JSON.parseObject(ids,new ArrayList().getClass());

            //记录日志
            for(String s:list){
                Order order = new Order();
                order.setId(new Integer(s));
                List<Order> l = orderDao.querySupplierList(order);
                if(l.size() == 1){
                    String content = l.get(0).toString();
                    Journal j = new Journal();
                    j.setContent(content);
                    j.setPerson(name);
                    j.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                    j.setType("删除订单");
                    journalDao.insertLog(j);
                }
            }

            //删除订单
            String idstr = "( "+StringUtils.join(list,",")+" )";
            return orderDao.delete(idstr)>0?"success":"false";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }


    @Override
    public Integer todayCount() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String startTime = format.format(new Date());
        return orderDao.queryCount(startTime,startTime);
    }

    @Override
    public Integer monthCount() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        Calendar cal_1=Calendar.getInstance();//获取当前日期
        cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天
        String startTime = format.format(cal_1.getTime());

        String endTime = format.format(new Date());

        return orderDao.queryCount(startTime,endTime);
    }

    @Override
    public ResponseTable today() {
        ResponseTable responseTable = new ResponseTable();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String endTime = format.format(new Date());
            List<Order> list = orderDao.today(endTime,endTime);
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
}
