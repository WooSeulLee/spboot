package com.test.spboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.spboot.mapper.CarInfoMapper;
import com.test.spboot.vo.CarInfoVO;
import com.test.spboot.vo.ResultList;

@Service
public class CarInfoService {	
	@Autowired
	private CarInfoMapper ciMapper;
	
	public ResultList<CarInfoVO> selectCars(CarInfoVO carInfo) {
		if(carInfo.getCount()==0) {
			carInfo.setCount(10);
		}
		if(carInfo.getPage()!=0) {
			int start = (carInfo.getPage()-1)*carInfo.getCount();
			carInfo.setStart(start);
		}
		ResultList<CarInfoVO> rl = new ResultList<>();
		List<CarInfoVO> cars = ciMapper.selectCars(carInfo);
		rl.setList(cars);
		int totalCnt = ciMapper.selectCarsTotal(carInfo);
		rl.setCount(totalCnt);
		return rl;
	}
	
	public CarInfoVO selectCar(int ciNum) {
		return ciMapper.selectCar(ciNum);
	}
	
	public int insertCar(CarInfoVO carInfo) {
		return ciMapper.insertCar(carInfo);
	}
	
	public int updateCar(CarInfoVO carInfo) {
		return ciMapper.updateCar(carInfo);
	}
	
	public int deleteCar(int ciNum) {
		return ciMapper.deleteCar(ciNum);
	}
}
