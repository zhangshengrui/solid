package com.zsr.solid.mapper;

import com.zsr.solid.entity.Calculation;

import java.util.List;

public interface CalculationDao {
    List<Calculation> queryCalculationList(Calculation calculation);
}
