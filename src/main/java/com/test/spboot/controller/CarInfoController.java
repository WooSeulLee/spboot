package com.test.spboot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.spboot.service.CarInfoService;
import com.test.spboot.vo.CarInfoVO;

@RestController
public class CarInfoController {

	@Autowired
	private CarInfoService ciService;
	
	@GetMapping("/cars")
	public List<CarInfoVO> getCars(){
		return ciService.selectCars();
	}
}
