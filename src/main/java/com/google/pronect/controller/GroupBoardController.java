package com.google.pronect.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.service.GroupBoardCommentService;
import com.google.pronect.service.GroupBoardService;
import com.google.pronect.service.GroupService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.GroupBoard;

@Controller
@RequestMapping("groupBoard")
public class GroupBoardController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupBoardService groupBoardService;
	@Autowired 
	private GroupBoardCommentService groupBoardReplyService;
	
	@RequestMapping(value="list", method={RequestMethod.GET, RequestMethod.POST})
	public String groupBoardList(GroupBoard groupboard, int gid, String pageNum, String boardPageNum, Model model) {
		model.addAttribute("groupBoard", groupBoardService.groupBoardList(groupboard, boardPageNum, model));
		model.addAttribute("paging", new Paging(groupBoardService.totCntGroupBoard(groupboard), boardPageNum));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/groupBoard/groupBoard";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detailGroupBoard(int gid, int group_bid, String boardPageNum, String commentPageNum, Model model) {
		model.addAttribute("groupBoardDetail", groupBoardService.detailGroupBoard(group_bid));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupBoardComment", groupBoardReplyService.groupBoardCommentList(group_bid, commentPageNum, model));
		return "group/groupBoard/groupBoardDetail";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeGroupBoardView(int gid, Model model) {
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/groupBoard/groupBoardWrite";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeGroupBoard(String pageNum, GroupBoard groupboard, MultipartHttpServletRequest mRequest, HttpServletRequest request, Model model) {
		model.addAttribute("writeResult", groupBoardService.writeGroupBoard(groupboard, mRequest, request));
		return "forward:list.do";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyGroupBoardView(int gid, int group_bid, Model model) {
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupBoardDetail", groupBoardService.detailGroupBoard(group_bid));
		return "group/groupBoard/groupBoardModify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyGroupBoard(GroupBoard groupboard, MultipartHttpServletRequest mRequest, HttpServletRequest request, Model model) {
		model.addAttribute("writeResult", groupBoardService.writeGroupBoard(groupboard, mRequest, request));
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String deleteGroupBoard(int gid, int group_bid, Model model) {
		groupBoardReplyService.deleteAllGroupBoardComment(group_bid);
		model.addAttribute("deleteResult", groupBoardService.deleteGroupBoard(group_bid));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/groupDetail";
	}
}