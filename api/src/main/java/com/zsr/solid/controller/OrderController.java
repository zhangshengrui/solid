package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.Order;
import com.zsr.solid.service.OrderBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderBusiness orderBusinessImpl;

    @RequestMapping("/index")
    public String index(){
        return "order";
    }

    @RequestMapping("order-add")
    public String order_add(Integer id, HttpServletRequest request){
        try {
            if(id == null){
                return "404";
            }
            HttpSession session = request.getSession();
            session.setAttribute("id",id);
            return "order-add";
        }catch (Exception e){
            return  "404";
        }
    }

    @RequestMapping("querySupplierList")
    @ResponseBody
    public String querySupplierList(Order order){
        return JSON.toJSONString(orderBusinessImpl.querySupplierList(order));
    }


    @RequestMapping("editSupplier")
    @ResponseBody
    public String editSupplier(@CookieValue("account")String account, Order order){
        return orderBusinessImpl.editSupplier(account,order);
    }

     @RequestMapping("delete")
     @ResponseBody
    public String delete(@CookieValue("account")String account,String password,String ids){
        return orderBusinessImpl.delete(account,password,ids);
    }
}
