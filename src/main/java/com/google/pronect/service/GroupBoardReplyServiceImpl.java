package com.google.pronect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.pronect.dao.GroupBoardReplyDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.GroupBoardReply;

@Service
public class GroupBoardReplyServiceImpl implements GroupBoardReplyService {
	@Autowired
	private GroupBoardReplyDao gboardReplyDao;
	@Override
	public List<GroupBoardReply> groupBoardReplyList(int group_bid, String replyPageNum, Model model) {
		GroupBoardReply greply = new GroupBoardReply();
		Paging paging = new Paging(gboardReplyDao.totCntGroupBoardReply(group_bid), replyPageNum, 5, 10);
		greply.setGroup_bid(group_bid);
		greply.setStartRow(paging.getStartRow());
		greply.setEndRow(paging.getEndRow());
		model.addAttribute("commentPaging", paging);
		return gboardReplyDao.groupBoardReplyList(greply);
	}

	@Override
	public int totCntGroupBoardReply(int group_bid) {
		return gboardReplyDao.totCntGroupBoardReply(group_bid);
	}

	@Override
	public int writeGroupBoardReply(GroupBoardReply gboard_reply) {
		return gboardReplyDao.writeGroupBoardReply(gboard_reply);
	}

	@Override
	public int modifyGroupBoardReply(GroupBoardReply gboard_reply) {
		return gboardReplyDao.modifyGroupBoardReply(gboard_reply);
	}

	@Override
	public int deleteGroupBoardReply(int group_repid) {
		return gboardReplyDao.deleteGroupBoardReply(group_repid);
	}

	@Override
	public int deleteAllGroupBoardReply(int group_bid) {
		return gboardReplyDao.deleteAllGroupBoardReply(group_bid);
	}

	@Override
	public GroupBoardReply groupBoardReplyContent(int group_repid) {
		return gboardReplyDao.groupBoardReplyContent(group_repid);
	}

}
