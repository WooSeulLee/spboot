package com.test.spboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.test.spboot.service.UserInfoService;
import com.test.spboot.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserInfoController {
	@Autowired
	private UserInfoService uiService;
	
	@GetMapping("/users")
	public List<UserInfoVO> getUsers(UserInfoVO userInfo){
		log.info("userInfo=>{}", userInfo);
		return uiService.selectUsers(userInfo);
	} 
	@GetMapping("/users/{uiNum}")
	public UserInfoVO getUser(@PathVariable("uiNum")int uiNum) {
		log.info("uiNum=>{}", uiNum);
		return uiService.selectUser(uiNum);
	}
	@DeleteMapping("/users/{uiNum}")
	public int removeUser(@PathVariable("uiNum")int uiNum) {
		return uiService.deleteUser(uiNum);
	}
}
