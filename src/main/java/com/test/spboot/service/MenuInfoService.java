package com.test.spboot.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.spboot.mapper.MenuInfoMapper;
import com.test.spboot.vo.MenuInfoVO;
import com.test.spboot.vo.ResultList;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MenuInfoService {

	private static final String UPLOAD_PATH = "C:\\Users\\i7\\git\\web-test99\\src\\main\\webapp\\upload\\";
	@Autowired
	private MenuInfoMapper miMapper;

	public ResultList<MenuInfoVO> selectMenus(MenuInfoVO menu) {
		if(menu.getCount()==0) {
			menu.setCount(10);
		}
		if(menu.getPage()!=0) {
			int start = (menu.getPage()-1)*menu.getCount();
			menu.setStart(start);
		}
		ResultList<MenuInfoVO> rl = new ResultList<>();
		List<MenuInfoVO> menus = miMapper.selectMenus(menu);
		rl.setList(menus);
		int totalCnt = miMapper.selectMenusTotal(menu);
		rl.setCount(totalCnt);
		return rl;
	}

	public MenuInfoVO selectMenu(int miNum) {
		MenuInfoVO menu = miMapper.selectMenu(miNum);
		return menu;
	}

	public int insertMenu(MenuInfoVO menu) {
		try {
			MultipartFile miFile = menu.getMiFile();
			if (miFile != null) {
				String name = miFile.getOriginalFilename();
				int idx = name.lastIndexOf(".");
				String ext = name.substring(idx);
				name = System.nanoTime() + ext;
				File f = new File(UPLOAD_PATH + name);
				miFile.transferTo(f);
				menu.setMiPath("/upload/" + name);
			}
			int result = miMapper.insertMenu(menu);
			return result;
		} catch (Exception e) {
			log.error("upload error=>{}",e);
		}
		return 0;
	}

	public int updateMenu(MenuInfoVO menu) {
		try {
			MultipartFile miFile = menu.getMiFile();
			if (miFile != null) {
				MenuInfoVO preMenu = selectMenu(menu.getMiNum());
				String miPath = preMenu.getMiPath();
				if(miPath != null && !"".equals(miPath)) {
					miPath = miPath.replace("/upload/", "");
					File f = new File(UPLOAD_PATH+miPath);
					if(f.exists()) {
						f.delete();
					}
				}
				
				
				String name = miFile.getOriginalFilename();
				int idx = name.lastIndexOf(".");
				String ext = name.substring(idx);
				name = System.nanoTime() + ext;
				File f = new File(UPLOAD_PATH + name);
				miFile.transferTo(f);
				menu.setMiPath("/upload/" + name);
			}
			int result = miMapper.updateMenu(menu);
			return result;
		} catch (Exception e) {
			log.error("upload error=>{}",e);
		}
		return 0;
	}

	public int deleteMenu(int miNum) {
		MenuInfoVO preMenu = selectMenu(miNum);
		String miPath = preMenu.getMiPath();
		if(miPath != null && !"".equals(miPath)) {
			miPath = miPath.replace("/upload/", "");
			File f = new File(UPLOAD_PATH+miPath);
			if(f.exists()) {
				f.delete();
			}
		}
		
		int result = miMapper.deleteMenu(miNum);
		return result;
	}

}
