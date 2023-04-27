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
	@RequestMapping(value="groupList", method= {RequestMethod.GET, RequestMethod.POST})
	public String goupList(String pageNum, Model model) {
		model.addAttribute("groupList",groupService.groupList(pageNum));
		model.addAttribute("paging",new Paging(groupService.groupTotCnt(),pageNum,12,12));
		return "main/main";
	}
	@RequestMapping(value="studyList", method= {RequestMethod.GET, RequestMethod.POST})
	public String studyList(String pageNum, Model model) {
		model.addAttribute("studyList",groupService.studyList(pageNum));
		model.addAttribute("paging",new Paging(groupService.studyTotCnt(),pageNum,12,10));
		return "main/main";
	}
	@RequestMapping(value="projectList", method= {RequestMethod.GET, RequestMethod.POST})
	public String projectList(String pageNum, Model model) {
		model.addAttribute("projectList",groupService.projectList(pageNum));
		model.addAttribute("paging",new Paging(groupService.projectTotCnt(),pageNum,12,10));
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
		model.addAttribute("joincheck", groupService.joinCheck(gid, session));
		model.addAttribute("joinList",groupService.joinList(gid));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("groupComment",gCommentService.commentContent(gid));
		model.addAttribute("commentCnt",groupService.getCommentCnt(gid));
		return "group/groupDetail2";
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
	@RequestMapping(value="accept", method=RequestMethod.GET)
	public String accept(String mid, int gid, Model model){
		model.addAttribute("acceptResult", groupService.acceptGroup(gid, mid));
		return "forward:detail.do";
	}
}
