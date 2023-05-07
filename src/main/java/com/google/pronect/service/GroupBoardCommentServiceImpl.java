package com.google.pronect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.pronect.dao.GroupBoardCommentDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.GroupBoardComment;

@Service
public class GroupBoardCommentServiceImpl implements GroupBoardCommentService {
	@Autowired
	private GroupBoardCommentDao gboardCommentDao;
	@Override
	public List<GroupBoardComment> groupBoardCommentList(int group_bid, String commentPageNum, Model model) {
		GroupBoardComment gComment = new GroupBoardComment();
		Paging paging = new Paging(gboardCommentDao.totCntGroupBoardComment(group_bid), commentPageNum, 5, 10);
		gComment.setGroup_bid(group_bid);
		gComment.setStartRow(paging.getStartRow());
		gComment.setEndRow(paging.getEndRow());
		model.addAttribute("commentPaging", paging);
		return gboardCommentDao.groupBoardCommentList(gComment);
	}

	@Override
	public int totCntGroupBoardComment(int group_bid) {
		return gboardCommentDao.totCntGroupBoardComment(group_bid);
	}

	@Override
	public int writeGroupBoardComment(GroupBoardComment gboard_comment) {
		return gboardCommentDao.writeGroupBoardComment(gboard_comment);
	}

	@Override
	public int modifyGroupBoardComment(GroupBoardComment gboard_comment) {
		return gboardCommentDao.modifyGroupBoardComment(gboard_comment);
	}

	@Override
	public int deleteGroupBoardComment(int group_cmtid) {
		return gboardCommentDao.deleteGroupBoardComment(group_cmtid);
	}

	@Override
	public int deleteAllGroupBoardComment(int group_bid) {
		return gboardCommentDao.deleteAllGroupBoardComment(group_bid);
	}

	@Override
	public int detailGroupBoardComment(int group_cmtid) {
		return gboardCommentDao.detailGroupBoardComment(group_cmtid);
	}
}
