package com.test.spboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.spboot.service.GoodsInfoService;
import com.test.spboot.vo.GoodsInfoVO;

import lombok.extern.slf4j.Slf4j;


@RestController
@Slf4j
public class GoodsInfoController {

	@Autowired
	private GoodsInfoService giService;
	
	@GetMapping("/goods")
	public List<GoodsInfoVO> getGoodsList(GoodsInfoVO goodsInfo) {
		log.info("goodsInfo=>{}", goodsInfo);
		return giService.selectGoodsList(goodsInfo);
	}
	
	@GetMapping("/goods/{giNum}")
	public GoodsInfoVO getGoods(@PathVariable("giNum") int giNum) {
		log.info("giNum=>{}",giNum);
		return giService.selectGoods(giNum);
	}
	
	@PostMapping("/goods")
	public int insertGoods(@RequestBody GoodsInfoVO goodsInfo) {
		log.info("goodsInfo=>{}", goodsInfo);
		return giService.insertGoods(goodsInfo);
	}
	
	@PutMapping("/goods")
	public int updateGoods(@RequestBody GoodsInfoVO goodsInfo) {
		return giService.updateGoods(goodsInfo);
	}
	
	@DeleteMapping("/goods/{giNum}")
	public int deleteGoods(@PathVariable int giNum) {
		return giService.deleteGoods(giNum);
	}
	
}
