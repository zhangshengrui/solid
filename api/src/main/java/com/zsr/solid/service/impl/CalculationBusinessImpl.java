package com.zsr.solid.service.impl;

import com.zsr.solid.entity.BaseSupplier;
import com.zsr.solid.entity.Calculation;
import com.zsr.solid.entity.ResponseTable;
import com.zsr.solid.mapper.CalculationDao;
import com.zsr.solid.service.CalculationBusiness;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class CalculationBusinessImpl implements CalculationBusiness {

    @Autowired
    private CalculationDao calculationDao;
    @Override
    public ResponseTable queryCalculationList(Calculation calculation) {
        ResponseTable responseTable = new ResponseTable();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            if(StringUtils.isBlank(calculation.getStartTime())){
                Calendar cal_1=Calendar.getInstance();//获取当前日期
                cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天
                String startTime = format.format(cal_1.getTime());
                calculation.setStartTime(startTime);
            }

            if(StringUtils.isBlank(calculation.getEndTime())){
                Calendar cal_1=Calendar.getInstance();//获取当前日期
                cal_1.set(Calendar.DAY_OF_MONTH,cal_1.getActualMaximum(Calendar.DAY_OF_MONTH));//设置最后一天
                String endTime = format.format(cal_1.getTime());
                calculation.setEndTime(endTime);
            }

            List<Calculation> list = calculationDao.queryCalculationList(calculation);
            responseTable.setData(list);
            responseTable.setRecordsFiltered(list.size());
            responseTable.setRecordsTotal(list.size());
            return responseTable;
        }catch (Exception e){
            e.printStackTrace();
            responseTable.setData(new ArrayList());
            responseTable.setRecordsFiltered(0);
            responseTable.setRecordsTotal(0);
            return responseTable;
        }
    }

    public static void main(String[] args) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal_1=Calendar.getInstance();//获取当前日期
        cal_1.set(Calendar.DAY_OF_MONTH,cal_1.getActualMaximum(Calendar.DAY_OF_MONTH));//设置为1号,当前日期既为本月第一天
        String startTime = format.format(cal_1.getTime());
        System.out.println(startTime);
    }
}
