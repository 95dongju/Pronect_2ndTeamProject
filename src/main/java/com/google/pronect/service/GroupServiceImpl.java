package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.GroupDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Group;
import com.google.pronect.vo.Member;
@Service
public class GroupServiceImpl implements GroupService {
	@Autowired
	private GroupDao groupDao;
	@Override
	public List<Group> groupList(String pageNum) {
		Paging paging = new Paging(groupDao.groupTotCnt(), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.groupList(group);
	}

	@Override
	public int groupTotCnt() {
		return groupDao.groupTotCnt();
	}
	
	@Override
	public List<Group> studyList(String pageNum) {
		Paging paging = new Paging(groupDao.studyTotCnt(), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.studyList(group);
	}
	
	@Override
	public int studyTotCnt() {
		return groupDao.studyTotCnt();
	}
	
	@Override
	public List<Group> projectList(String pageNum) {
		Paging paging = new Paging(groupDao.projectTotCnt(), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.projectList(group);
	}
	
	@Override
	public int projectTotCnt() {
		return groupDao.projectTotCnt();
	}
	@Override
	public int groupLeader(HttpSession session) {
		// 세션 객체에서 "member" 속성의 값을 가져오기
		Object memberObj = session.getAttribute("member");
		String mid="";
		// 가져온 값을 원하는 데이터 타입으로 형변환
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member 클래스에서 id 필드에 해당하는 getter 메서드를 사용하여 id 값을 가져옴
		    // id 값 사용
		}
		return groupDao.groupLeader(mid);
	}

	@Override
	public int registerGroup(Group group, String[] glanguage) {
		group.setGlanguage1("");
		group.setGlanguage2("");
		group.setGlanguage3("");
	    if (glanguage != null) {
	        for (int i = 0; i < glanguage.length; i++) {
	            if (i == 0) {
	                group.setGlanguage1(glanguage[i]);
	            } else if (i == 1) {
	                group.setGlanguage2(glanguage[i]);
	            } else if (i == 2) {
	                group.setGlanguage3(glanguage[i]);
	            }
	        }
	    }
		String mid = group.getMid();
		groupDao.registerGroup(group);
		int gid = groupDao.getRegisteredGid(mid);
		return groupDao.insertHistory(gid, mid);
	}

	@Override
	public int getRegisteredGid(String mid) {
		return groupDao.getRegisteredGid(mid);
	}

	@Override
	public int insertHistory(int gid, String mid) {
		return groupDao.insertHistory(gid, mid);
	}

	@Override
	public Group getGroupDetail(int gid) {
		groupDao.groupHitUp(gid);
		return groupDao.getGroupDetail(gid);
	}
	@Override
	public Group getAfterModifyView(int gid) {
		return groupDao.getGroupDetail(gid);
	}

	@Override
	public int modifyGroup(Group group, String[] glanguage) {
		group.setGlanguage1("");
		group.setGlanguage2("");
		group.setGlanguage3("");
	    if (glanguage != null) {
	        for (int i = 0; i < glanguage.length; i++) {
	            if (i == 0) {
	                group.setGlanguage1(glanguage[i]);
	            } else if (i == 1) {
	                group.setGlanguage2(glanguage[i]);
	            } else if (i == 2) {
	                group.setGlanguage3(glanguage[i]);
	            }
	        }
	    }
		return groupDao.modifyGroup(group);
	}

	@Override
	public int deleteHistory(int gid) {
		return groupDao.deleteHistory(gid);
	}

	@Override
	public int deleteGroup(int gid) {
		return groupDao.deleteGroup(gid);
	}

	@Override
	public int joinCheck(int gid, HttpSession session) {
		Object memberObj = session.getAttribute("member");
		Group group = new Group();
		String mid="null";
		// 가져온 값을 원하는 데이터 타입으로 형변환
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member 클래스에서 id 필드에 해당하는 getter 메서드를 사용하여 id 값을 가져옴
		    // id 값 사용
		}
		group.setMid(mid);
		group.setGid(gid);
		return groupDao.joinCheck(group);
	}
	
	@Override
	public int joinGroup(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group.setGid(gid);
			group.setMid(mid);
		}
		return groupDao.joinGroup(group);
	}

	@Override
	public int unJoinGroup(int gid, String mid) {
		return groupDao.unJoinGroup(gid, mid);
	}
	
	@Override
	public int acceptGroup(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group.setGid(gid);
			group.setMid(mid);
		}
		return groupDao.acceptGroup(group);
	}

	@Override
	public int completeGroup(int gid) {
		return groupDao.completeGroup(gid);
	}

	@Override
	public String startDate(int gid) {
		return groupDao.startDate(gid);
	}

	@Override
	public String endDate(int gid) {
		// TODO Auto-generated method stub
		return groupDao.endDate(gid);
	}

	@Override
	public List<Group> joinList(int gid) {
		// TODO Auto-generated method stub
		return groupDao.joinList(gid);
	}

	@Override
	public int getCommentCnt(int gid) {
		return groupDao.getCommentCnt(gid);
	}
}
