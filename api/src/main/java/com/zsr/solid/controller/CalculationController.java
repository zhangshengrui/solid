package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.Calculation;
import com.zsr.solid.service.CalculationBusiness;
import com.zsr.solid.util.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("calculation")
public class CalculationController {

    @Autowired
    private CalculationBusiness calculationBusinessImpl;

    @RequestMapping("/index")
    public String index() {
        return "calculation";
    }

    @RequestMapping("queryCalculationList")
    @ResponseBody
    public String queryCalculationList(Calculation calculation){
        return JSON.toJSONString(calculationBusinessImpl.queryCalculationList(calculation));
    }

    @RequestMapping("report")
    @ResponseBody
    public void export(HttpServletRequest request, HttpServletResponse response, Calculation calculation) throws Exception {
        //获取数据
        List<Calculation> list = calculationBusinessImpl.queryCalculationList(calculation).getData();
        String content[][] = new String[list.size()][];

        //excel标题
        String[] title = {"日期", "收货单位", "编码", "货物名称", "车数", "发货总重", "发货计费", "发货价格",
                "收货总重", "收货计费", "收货价格", "汇总利润", "全部发货价格", "全部收货价格", "全部利润"};

        //excel文件名
        String fileName = "订单汇总表" + System.currentTimeMillis() + ".xls";

        //sheet名
        String sheetName = "订单汇总表";

        for (int i = 0; i < list.size(); i++) {
            content[i] = new String[title.length];
            Calculation obj = list.get(i);
            content[i][0] = obj.getDate();
            content[i][1] = obj.getReceiverName();
            content[i][2] = obj.getFleetNumber();
            content[i][3] = obj.getGoodsName();
            content[i][4] = obj.getCount()+"";
            content[i][5] = obj.getGoodsTonnage()+"";
            content[i][6] = obj.getGoodsTotal()+"";
            content[i][7] = obj.getGoodsBid()+"";
            content[i][8] = obj.getReceiverTonnage()+"";
            content[i][9] = obj.getReceiverTotal()+"";
            content[i][10] = obj.getReceiverBid()+"";
            content[i][11] = obj.getAccount()+"";
            content[i][12] = obj.getMonthFrom()+"";
            content[i][13] = obj.getMonthTo()+"";
            content[i][14] = obj.getMonthProfit()+"";
        }

        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getCalculationWorkbook(sheetName, title, content, null);

        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
