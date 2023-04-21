package com.google.pronect.dao;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.SComment;

@Mapper
public interface SCommentDao {
	public int comment(SComment scomment);
	public int commentContent(int sid);
	public int commentModify(SComment scomment); 
	public int commentDelete(int scid);
}
