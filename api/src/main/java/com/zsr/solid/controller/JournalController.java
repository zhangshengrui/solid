package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.Journal;
import com.zsr.solid.service.JournalBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("journal")
public class JournalController {
    @Autowired
    private JournalBusiness journalBusinessImpl;

    @RequestMapping("/index")
    public String index() {
        return "journal";
    }


    @RequestMapping("querySupplierList")
    @ResponseBody
    public String querySupplierList(Journal journal){
        return JSON.toJSONString(journalBusinessImpl.querySupplierList(journal));
    }

}
