package com.google.pronect.dao;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Flike;

@Mapper
public interface FlikeDao {
	public int findLike(Flike flike);
	public int getLike(Flike flike);
	public int likeUp(Flike flike);
	public int likeDown(Flike flike);
}
