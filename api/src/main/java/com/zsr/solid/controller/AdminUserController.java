package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.User;
import com.zsr.solid.service.AdminUserBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminUserController {
    @Autowired
    private AdminUserBusiness adminUserBusinessImpl;

    @RequestMapping("/user")
    public String index() {
        return "admin-role";
    }
    @RequestMapping("admin-role-add")
    public String user_add(Integer id, HttpServletRequest request){
        try {
            if(id == null){
                return "404";
            }
            HttpSession session = request.getSession();
            session.setAttribute("id",id);
            return "admin-role-add";
        }catch (Exception e){
            return  "404";
        }
    }

    @RequestMapping("querySupplierList")
    @ResponseBody
    public String querySupplierList(User user){
        return JSON.toJSONString(adminUserBusinessImpl.querySupplierList(user));
    }

    @RequestMapping("operate")
    @ResponseBody
    public String operate(User user) {
        return adminUserBusinessImpl.operate(user);
    }

    @RequestMapping("editSupplier")
    @ResponseBody
    public String editSupplier(User user){
        return adminUserBusinessImpl.editSupplier(user);
    }

     @RequestMapping("delete")
     @ResponseBody
     public String delete(String password,String ids){
        return adminUserBusinessImpl.delete(password,ids);
    }
}
