package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.GroupBoard;
import com.google.pronect.vo.GroupBoardComment;

public interface GroupBoardCommentService {
	public List<GroupBoardComment> groupBoardCommentList(int group_bid, String commentPageNum, Model model);
	public int totCntGroupBoardComment(int group_bid);
	public int writeGroupBoardComment(GroupBoardComment gboard_comment);
	public int modifyGroupBoardComment(GroupBoardComment gboard_comment);
	public int detailGroupBoardComment(int group_cmtid);
	public int deleteGroupBoardComment(int group_cmtid);
	public int deleteAllGroupBoardComment(int group_bid);
	//public GroupBoardComment groupBoardCommentContent(int group_cmtid);
}
