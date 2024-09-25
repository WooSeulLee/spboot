package com.test.spboot;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.test.spboot.mapper.MenuInfoMapper;
import com.test.spboot.service.MenuInfoService;
import com.test.spboot.vo.MenuInfoVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class SpbootApplicationTests {

	@Autowired
	private MenuInfoService miService;
	@Test
	void contextLoads() {
		MenuInfoVO menu = new MenuInfoVO();
		menu.setMiName("김밥");
		menu.setMiPrice(3000);
		menu.setMiDesc("기본 야채 김밥");
		//진짜 DB에 들어감
		
		int result = miService.insertMenu(menu);
		log.info("insert result=>{}", result);
		
//		List<MenuInfoVO> list = miService.selectMenus(menu);
//		log.info("select result=>{}", list);
		
		MenuInfoVO m = miService.selectMenu(2);
		log.info("select menu=>{}", m);
		
		result = miService.updateMenu(menu);
		log.info("update result=>{}", result);
		
		result = miService.deleteMenu(2);
		log.info("delete result=>{}", result);
	}

}
