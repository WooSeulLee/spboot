package com.test.spboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.spboot.mapper.CarInfoMapper;
import com.test.spboot.vo.CarInfoVO;

@Service
public class CarInfoService {	
	@Autowired
	private CarInfoMapper ciMapper;
	
	public List<CarInfoVO> selectCars() {
		return ciMapper.selectCars();
	}
}
