package com.google.pronect.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.GCommentService;
import com.google.pronect.service.GroupService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Group;

@Controller
@RequestMapping(value="group")
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GCommentService gCommentService;
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("groupList",groupService.groupList(pageNum));
		model.addAttribute("paging",new Paging(groupService.groupTotCnt(),pageNum));
		return "main/main";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(){
		return "group/groupRegister";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(Group group, Model model, String[] glanguage){
	    model.addAttribute("groupRegisterResult",groupService.registerGroup(group, glanguage));
		return "forward:list.do";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(int gid, Model model, String pageNum, HttpSession session){
		System.out.println(gid);
		System.out.println("test1");
		model.addAttribute("joincheck", groupService.joinCheck(gid, session));
		System.out.println("test2");
		model.addAttribute("joinList",groupService.joinList(gid));
		System.out.println("test3");
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		System.out.println("test4");
		model.addAttribute("pageNum",pageNum);
		System.out.println("test5");
		model.addAttribute("groupComment",gCommentService.commentContent(gid));
		System.out.println("test6");
		return "group/groupDetail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int gid, Model model){
		model.addAttribute("groupDetail",groupService.getAfterModifyView(gid));
		return "group/groupModify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify_post(Group group, Model model, String[] glanguage){
		model.addAttribute("groupModifyResult",groupService.modifyGroup(group, glanguage));
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int gid, Model model){
		groupService.deleteHistory(gid);
		model.addAttribute("groupDeleteResult",groupService.deleteGroup(gid));
		return "forward:list.do";
	}
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(int gid, String mid, String pageNum, Model model){
		System.out.println("test7");
		model.addAttribute("pageNum", pageNum);
		System.out.println("GID"+gid+"mid"+mid);
		model.addAttribute("joinResult", groupService.joinGroup(gid, mid));
		System.out.println("test9");
		return "forward:detail.do";
	}
	@RequestMapping(value="unJoin", method=RequestMethod.GET)
	public String unJoin(int gid, String mid, String pageNum, Model model){
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("unJoinResult", groupService.unJoinGroup(gid, mid));
		return "forward:detail.do";
	}
}
