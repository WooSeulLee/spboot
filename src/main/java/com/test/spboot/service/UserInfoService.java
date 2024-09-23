package com.test.spboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.spboot.mapper.UserInfoMapper;
import com.test.spboot.vo.UserInfoVO;

@Service
public class UserInfoService {	
	@Autowired
	private UserInfoMapper uiMapper;
	
	public List<UserInfoVO> selectUsers(UserInfoVO userInfo) {
		return uiMapper.selectUsers(userInfo);
	}
	
	public UserInfoVO selectUser(int uiNum) {
		return uiMapper.selectUser(uiNum);
	}
	
	public int deleteUser(int uiNum) {
		return uiMapper.deleteUser(uiNum);
	}
}
