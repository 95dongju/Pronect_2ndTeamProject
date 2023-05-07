package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.GroupBoardComment;

@Mapper
public interface GroupBoardCommentDao {
	public List<GroupBoardComment> groupBoardCommentList(GroupBoardComment gboard_comment);
	public int totCntGroupBoardComment(int group_bid);
	public int writeGroupBoardComment(GroupBoardComment gboard_comment);
	public int modifyGroupBoardComment(GroupBoardComment gboard_comment);
	public int deleteGroupBoardComment(int group_cmtid);
	public int detailGroupBoardComment(int group_cmtid);
	public int deleteAllGroupBoardComment(int group_bid);
}
