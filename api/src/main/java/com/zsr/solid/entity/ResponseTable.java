package com.zsr.solid.entity;

import java.util.List;

public class ResponseTable<T> {

    private List<T> data;           //数据格式
    private Integer recordsTotal;   //当前数据总数
    private Integer recordsFiltered;//筛选总数

    
    public List<T> getData() {
		return data;
	}

    public void setData(List<T> data) {
        this.data = data;
    }

    public void setRecordsTotal(Integer recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }
}
