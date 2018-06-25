package com.zsr.solid.service;

import com.zsr.solid.entity.Calculation;
import com.zsr.solid.entity.ResponseTable;

public interface CalculationBusiness {
    ResponseTable queryCalculationList(Calculation calculation);
}
