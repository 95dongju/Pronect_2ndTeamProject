package com.google.pronect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.GroupBoardReplyService;
import com.google.pronect.service.GroupBoardService;
import com.google.pronect.service.GroupService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.GroupBoard;
import com.google.pronect.vo.GroupBoardReply;

@Controller
@RequestMapping("groupBoard")
public class GroupBoardController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupBoardService groupBoardService;
	@Autowired 
	private GroupBoardReplyService groupBoardReplyService;
	
	@RequestMapping(value="list", method={RequestMethod.GET, RequestMethod.POST})
	public String groupBoardList(GroupBoard groupboard, int gid, String pageNum, Model model) {
		model.addAttribute("groupBoard", groupBoardService.groupBoardList(groupboard, pageNum, model));
		model.addAttribute("paging", new Paging(groupBoardService.totCntFboard(groupboard), pageNum));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/groupBoard/groupBoard";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detailGroupBoard(int group_bid, String replyPageNum, Model model) {
		model.addAttribute("groupBoardDetail", groupBoardService.detailGroupBoard(group_bid));
		model.addAttribute("groupBoardComment", groupBoardReplyService.groupBoardReplyList(group_bid, replyPageNum, model));
		System.out.println(groupBoardReplyService.groupBoardReplyList(group_bid, replyPageNum, model));
		return "group/groupBoard/groupBoardDetail";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeGroupBoard(int gid, Model model) {
		model.addAttribute("gid", gid);
		return "group/groupBoard/groupBoardWrite";
	}
}
