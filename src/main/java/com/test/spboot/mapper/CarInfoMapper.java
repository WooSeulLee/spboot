package com.test.spboot.mapper;

import java.util.List;

import com.test.spboot.vo.CarInfoVO;

public interface CarInfoMapper {
	public List<CarInfoVO> selectCars();
}
