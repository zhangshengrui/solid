package com.zsr.solid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("base")
public class BaseInfoController {

    @RequestMapping("base-supplier")
    public String supplier(){
        return "base-supplier";
    }

    @RequestMapping("base-goods")
    public String goods(){
        return "base-goods";
    }

    @RequestMapping("base-fleet")
    public String fleet(){
        return "base-fleet";
    }

    @RequestMapping("base-receiver")
    public String receive(){
        return "base-receiver";
    }

    @RequestMapping("base-supplier-add")
    public String base_supplier_add(Integer id, HttpServletRequest request){
        try {
            if(id == null){
                return "404";
            }
            HttpSession session = request.getSession();
            session.setAttribute("id",id);
            return "base-supplier-add";
        }catch (Exception e){
            return  "404";
        }
    }

    @RequestMapping("base-goods-add")
    public String base_goods_add(Integer id, HttpServletRequest request){
        try {
            if(id == null){
                return "404";
            }
            HttpSession session = request.getSession();
            session.setAttribute("id",id);
            return "base-goods-add";
        }catch (Exception e){
            return  "404";
        }
    }

    @RequestMapping("base-fleet-add")
    public String base_fleet_add(Integer id, HttpServletRequest request){
        try {
            if(id == null){
                return "404";
            }
            HttpSession session = request.getSession();
            session.setAttribute("id",id);
            return "base-fleet-add";
        }catch (Exception e){
            return  "404";
        }
    }

    @RequestMapping("base-receiver-add")
    public String base_receiver_add(Integer id, HttpServletRequest request){
        try {
            if(id == null){
                return "404";
            }
            HttpSession session = request.getSession();
            session.setAttribute("id",id);
            return "base-receiver-add";
        }catch (Exception e){
            return  "404";
        }
    }
}
