package com.test.spboot.mapper;

import java.util.List;

import com.test.spboot.vo.GoodsInfoVO;

public interface GoodsInfoMapper {
	public List<GoodsInfoVO> selectGoodsList(GoodsInfoVO goodsInfo);
	public GoodsInfoVO selectGoods(int giNum);
	public int insertGoods(GoodsInfoVO goodsInfo);
	public int updateGoods(GoodsInfoVO goodsInfo);
	public int deleteGoods(int giNum);
}
