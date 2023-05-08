package com.google.pronect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.GroupBoardCommentService;
import com.google.pronect.vo.GroupBoardComment;

@Controller
@RequestMapping("groupBoardComment")
public class GroupBoardCommentController {
	@Autowired
	private GroupBoardCommentService gboardCommentService;
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write(GroupBoardComment gboard_comment, Model model) {
		model.addAttribute("fcommentWriteResult", gboardCommentService.writeGroupBoardComment(gboard_comment));
		return "forward:../groupBoard/detail.do?group_bid="+gboard_comment.getGroup_bid();
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(GroupBoardComment gboard_comment, String pageNum, String commentPageNum, Model model) {
		model.addAttribute("fcommentDeleteResult", gboardCommentService.deleteGroupBoardComment(gboard_comment.getGroup_cmtid()));
		return "forward:../groupBoard/detail.do?group_bid="+gboard_comment.getGroup_bid()+"&pageNum="+pageNum;
	}
	@RequestMapping(value = "modifyView", method = RequestMethod.GET)
	public String modifyView(int group_cmtid, Model model) {
		model.addAttribute("fcomment", gboardCommentService.detailGroupBoardComment(group_cmtid));
		return "groupBoard/commentModify";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(GroupBoardComment gboard_comment, Model model) {
		model.addAttribute("fcommentModifyResult", gboardCommentService.modifyGroupBoardComment(gboard_comment));
		return "forward:../groupBoard/detail.do?group_bid="+gboard_comment.getGroup_bid();
	}
}
