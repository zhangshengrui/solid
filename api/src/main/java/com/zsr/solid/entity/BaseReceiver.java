package com.zsr.solid.entity;

public class BaseReceiver {
    private Integer id;                 //主键ID
    private String supplierName;        //收货商名称
    private String price;        //收货商名称
    private String supplierAddress;     //收货商地址
    private String supplierOfficial;    //收应商负责人
    private String telephone;           //收应商电话
    private Integer status;             //当前状态（0：正常 1：关闭 -1：删除）
    private String memo;                //备注
    private String indate;              //添加日期

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }

    public String getSupplierOfficial() {
        return supplierOfficial;
    }

    public void setSupplierOfficial(String supplierOfficial) {
        this.supplierOfficial = supplierOfficial;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getIndate() {
        return indate;
    }

    public void setIndate(String indate) {
        this.indate = indate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
