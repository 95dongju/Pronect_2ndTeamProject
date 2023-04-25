package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.SComment;

@Mapper
public interface SCommentDao {
	public int comment(SComment scomment);
	public List<SComment> commentContent(int sid);
	public int commentModify(SComment scomment); 
	public int commentDelete(int scid);
}
