package com.test.spboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.test.spboot.service.CarInfoService;
import com.test.spboot.vo.CarInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CarInfoController {
	// GET : 조회할때
	/*
	 * POST : 추가
	 * PUT : 수정
	 * DELETE : 삭제
	 */
	@Autowired
	private CarInfoService ciService;
	
	@GetMapping("/cars")
	public List<CarInfoVO> getCars(CarInfoVO carInfo){
		log.info("carInfo=>{}", carInfo);
		return ciService.selectCars(carInfo);
	}
	@GetMapping("/cars/{ciNum}")
	public CarInfoVO getCar(@PathVariable("ciNum")int ciNum) {
		log.info("ciNum=>{}", ciNum);
		return ciService.selectCar(ciNum);
	}
	@DeleteMapping("/cars/{ciNum}")
	public int removeCar(@PathVariable("ciNum")int ciNum) {
		return ciService.deleteCar(ciNum);
	}
}
