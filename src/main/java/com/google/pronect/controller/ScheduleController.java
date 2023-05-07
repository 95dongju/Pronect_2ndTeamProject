package com.google.pronect.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.pronect.service.AchiveService;
import com.google.pronect.service.GroupService;
import com.google.pronect.service.ScheduleService;
import com.google.pronect.vo.Achive;
import com.google.pronect.vo.Group;
import com.google.pronect.vo.Schedule;

@Controller
@RequestMapping(value="group/schedule")
public class ScheduleController {
	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private AchiveService achiveService;
	@GetMapping("list")
	@ResponseBody
	public List<Map<String, Object>> totalSchedule(int gid) throws Exception {
		List<Schedule> list = scheduleService.totalSchedule(gid);
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();
		for(int i=0; i < list.size(); i++) {			
			hash.put("title", list.get(i).getScd_title());
			hash.put("cal_memo", list.get(i).getScd_memo()); 
			hash.put("groupId", list.get(i).getGid());
			hash.put("id", list.get(i).getScd_id());
			hash.put("start", list.get(i).getScd_start());
			hash.put("end", list.get(i).getScd_end()); 
			hash.put("allDay", "true");
			jsonObj = new JSONObject(hash); 
			jsonArr.add(jsonObj); 
		}
		log.info("jsonArrCheck: {}", jsonArr);
		return jsonArr;
	}
	@RequestMapping(value="myGroupSchedule", method=RequestMethod.GET)
	public String myGroup(int gid, Model model) {
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupSchedule", scheduleService.totalSchedule(gid));
		return "group/schedule/groupCalendar";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detailSchedule(int scd_id) {
		return "group/detail";
	}
	@RequestMapping(value="gantt", method=RequestMethod.GET)
	public String gantt() {
		return "group/ganttChart/gantt";
	}
	@RequestMapping(value="insertGroupSchedulePopup", method=RequestMethod.GET)
	public String insertGroupScheduleView(int gid, Model model) {
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/schedule/insertGroupSchedule";
	}
	@RequestMapping(value="insertGroupSchedule", method=RequestMethod.GET)
	public String insertGroupSchedule(int gid, Schedule schedule, Group group, Model model, Achive achive) {
		scheduleService.insertGroupSchedule(schedule, group);
		achiveService.insertAchive(achive, gid);
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/schedule/groupCalendar";
	}
	@RequestMapping(value="insertSchedulePopup", method=RequestMethod.GET)
	public String insertScheduleView(int gid, Model model) {
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/schedule/insertSchedule";
	}
	@RequestMapping(value="insertSchedule", method=RequestMethod.GET)
	public String insertSchedule(int gid, Schedule schedule, Group group, Model model, Achive achive) {
		scheduleService.insertSchedule(schedule, group);
		achiveService.insertAchive(achive, gid);
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		return "group/schedule/groupCalendar";
	}
	@RequestMapping(value="achive", method=RequestMethod.GET)
	public String achiveSchedule(@Param("scd_id") int scd_id, @Param("mid") String mid, int gid, Model model) {
		System.out.println(scd_id);
		System.out.println(mid);
		achiveService.updateAchive(scd_id, mid);
		System.out.println("업데이트 완료");
		return "forward:myGroupSchedule.do";
	}
}
