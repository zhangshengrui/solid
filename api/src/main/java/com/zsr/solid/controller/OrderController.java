package com.zsr.solid.controller;

import com.alibaba.fastjson.JSON;
import com.zsr.solid.entity.Order;
import com.zsr.solid.service.OrderBusiness;
import com.zsr.solid.util.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

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

    @RequestMapping("today")
    @ResponseBody
    public String today(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        session.setAttribute("todayCount",orderBusinessImpl.todayCount());
        session.setAttribute("monthCount",orderBusinessImpl.monthCount());
        return JSON.toJSONString(orderBusinessImpl.today());
    }

    @RequestMapping("report")
    @ResponseBody
    public void export(HttpServletRequest request,HttpServletResponse response,Order order) throws Exception {
        //获取数据
        List<Order> list = orderBusinessImpl.querySupplierList(order).getData();
        String content[][]=new String[list.size()][];

        //excel标题
        String[] title = {"日期","供货单号","编码","车号","品名","供货单位","吨位/方数","转换比例","计费数量","货物单价","货物金额","收货单位","收货方单号","吨位/方数",
                "转换比例","计费数量","收货方单价","收货方金额","利润","备注信息"};

        //excel文件名
        String fileName = "订单详情表"+System.currentTimeMillis()+".xls";

        //sheet名
        String sheetName = "订单详情表";

        for (int i = 0; i < list.size(); i++) {
            content[i] = new String[title.length];
            Order obj = list.get(i);
            content[i][0] = obj.getDate();
            content[i][1] = obj.getSupplierCertify();
            content[i][2] = obj.getFleetLicense();
            content[i][3] = obj.getFleetNumber();
            content[i][4] = obj.getGoodsName();
            content[i][5] = obj.getSupplierName();
            content[i][6] = obj.getTonnage();
            content[i][7] = obj.getConversion();
            content[i][8] = obj.getGoodsCount();
            content[i][9] = obj.getGoodsPrice();
            content[i][10] = obj.getGoodsMoney();
            content[i][11] = obj.getReceiverName();
            content[i][12] = obj.getReceiverCertify();
            content[i][13] = obj.getCompany();
            content[i][14] = obj.getReceiverConversion();
            content[i][15] = obj.getReceiverCount();
            content[i][16] = obj.getReceiverPrice();
            content[i][17] = obj.getReceiverMoney();
            content[i][18] = obj.getProfit();
            content[i][19] = obj.getMemo();
        }

        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getOrderWorkbook(sheetName, title, content, null);

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
