package com.zsr.solid.entity;

public class Calculation {
    private String date ;//日期
    private String fleetNumber;//车队编码
    private String goodsName;//货物名称
    private String receiverName;//收货方名称
    private Float count;  //订单总数
    private Float goodsTonnage;//发货方总重量
    private Float goodsTotal; //发货方计费总数
    private Float goodsBid; //发货方总价格
    private Float receiverTonnage;//收货方总重量
    private Float receiverTotal;//收货方计费数量
    private Float receiverBid;//收货方总价格
    private Float account;//总利润
    private Float monthFrom;//当月总入账
    private Float monthTo;//当月总出账
    private Float monthProfit;//当月总利润

    private String startTime;//开始时间
    private String endTime;//结束时间


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

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public Float getCount() {
        return count;
    }

    public void setCount(Float count) {
        this.count = count;
    }

    public Float getGoodsTonnage() {
        return goodsTonnage;
    }

    public void setGoodsTonnage(Float goodsTonnage) {
        this.goodsTonnage = goodsTonnage;
    }

    public Float getGoodsTotal() {
        return goodsTotal;
    }

    public void setGoodsTotal(Float goodsTotal) {
        this.goodsTotal = goodsTotal;
    }

    public Float getGoodsBid() {
        return goodsBid;
    }

    public void setGoodsBid(Float goodsBid) {
        this.goodsBid = goodsBid;
    }

    public Float getReceiverTonnage() {
        return receiverTonnage;
    }

    public void setReceiverTonnage(Float receiverTonnage) {
        this.receiverTonnage = receiverTonnage;
    }

    public Float getReceiverTotal() {
        return receiverTotal;
    }

    public void setReceiverTotal(Float receiverTotal) {
        this.receiverTotal = receiverTotal;
    }

    public Float getReceiverBid() {
        return receiverBid;
    }

    public void setReceiverBid(Float receiverBid) {
        this.receiverBid = receiverBid;
    }

    public Float getAccount() {
        return account;
    }

    public void setAccount(Float account) {
        this.account = account;
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

    public Float getMonthFrom() {
        return monthFrom;
    }

    public void setMonthFrom(Float monthFrom) {
        this.monthFrom = monthFrom;
    }

    public Float getMonthTo() {
        return monthTo;
    }

    public void setMonthTo(Float monthTo) {
        this.monthTo = monthTo;
    }

    public Float getMonthProfit() {
        return monthProfit;
    }

    public void setMonthProfit(Float monthProfit) {
        this.monthProfit = monthProfit;
    }
}
