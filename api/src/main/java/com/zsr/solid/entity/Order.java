package com.zsr.solid.entity;

public class Order {
    private Integer id;             //订单ID
    private String date;            //订单日期
    private String fleetNumber;     //车队编码
    private String fleetLicense;    //车队车牌号
    private String goodsName;       //货物名称
    private String supplierName;    //供货商名称
    private String supplierCertify; //供货单号
    private String goodsCount;      //计费数量
    private String goodsPrice;      //货物单价
    private String goodsMoney;      //货物金额
    private String receiverName;    //收货方
    private String receiverCertify; //收货方单号
    private String receiverCount;   //收货方数量
    private String receiverPrice;   //收货方单价
    private String receiverMoney;   //收货方金额
    private String profit;          //利润
    private String memo;            //备注
    private String indate;          //增加日期
    private Integer status;         //状态(0:正常 -1删除 )

    //辅助字段
    private String startTime;       //订单日期
    private String endTime;         //结束日期

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFleetNumber() {
        return fleetNumber;
    }

    public void setFleetNumber(String fleetNumber) {
        this.fleetNumber = fleetNumber;
    }

    public String getFleetLicense() {
        return fleetLicense;
    }

    public void setFleetLicense(String fleetLicense) {
        this.fleetLicense = fleetLicense;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getSupplierCertify() {
        return supplierCertify;
    }

    public void setSupplierCertify(String supplierCertify) {
        this.supplierCertify = supplierCertify;
    }

    public String getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(String goodsCount) {
        this.goodsCount = goodsCount;
    }

    public String getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(String goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsMoney() {
        return goodsMoney;
    }

    public void setGoodsMoney(String goodsMoney) {
        this.goodsMoney = goodsMoney;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverCertify() {
        return receiverCertify;
    }

    public void setReceiverCertify(String receiverCertify) {
        this.receiverCertify = receiverCertify;
    }

    public String getReceiverCount() {
        return receiverCount;
    }

    public void setReceiverCount(String receiverCount) {
        this.receiverCount = receiverCount;
    }

    public String getReceiverPrice() {
        return receiverPrice;
    }

    public void setReceiverPrice(String receiverPrice) {
        this.receiverPrice = receiverPrice;
    }

    public String getReceiverMoney() {
        return receiverMoney;
    }

    public void setReceiverMoney(String receiverMoney) {
        this.receiverMoney = receiverMoney;
    }

    public String getProfit() {
        return profit;
    }

    public void setProfit(String profit) {
        this.profit = profit;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
