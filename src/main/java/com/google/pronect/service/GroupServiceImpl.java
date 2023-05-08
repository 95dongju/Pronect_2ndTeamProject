package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.AchiveDao;
import com.google.pronect.dao.GCommentDao;
import com.google.pronect.dao.GroupDao;
import com.google.pronect.dao.ScheduleDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Achive;
import com.google.pronect.vo.GComment;
import com.google.pronect.vo.Group;
import com.google.pronect.vo.Member;
import com.google.pronect.vo.Schedule;
@Service
public class GroupServiceImpl implements GroupService {
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private GCommentDao gcommentDao;
	@Autowired
	private AchiveDao achiveDao;
	@Autowired
	private ScheduleDao scheduleDao;
	/////////////////////////groupList.do//////////////////////////////////////////
	@Override //전체 그룹 페이징용 startRow,endRow//
	public List<Group> groupList(String pageNum) {
		if( pageNum!=null) {
			Paging paging = new Paging(groupDao.groupTotCnt(), pageNum, 12, 10);
			Group group = new Group();
			group.setStartRow(paging.getStartRow());
			group.setEndRow(paging.getEndRow());
			return groupDao.groupList(group);
		}
		System.out.println(pageNum);
		System.out.println("studyList 오류");
		return null;
	}

	@Override //전체 그룹 수//
	public int groupTotCnt() {
		return groupDao.groupTotCnt();
	}
	
	/////////////////////////studyList.do//////////////////////////////////////////
	@Override //스터디 페이징용 startRow,endRow//
	public List<Group> studyList(String pageNum) {
		if( pageNum!=null) {
			Paging paging = new Paging(groupDao.studyTotCnt(), pageNum, 12, 10);
			Group group = new Group();
			group.setStartRow(paging.getStartRow());
			group.setEndRow(paging.getEndRow());
			return groupDao.studyList(group);
		}
		System.out.println(pageNum);
		System.out.println("studyList 오류");
		return null;
	}
	
	@Override //스터디 전체 수//
	public int studyTotCnt() {
		return groupDao.studyTotCnt();
	}
	
	/////////////////////////projectList.do//////////////////////////////////////////
	@Override //프로젝트 페이징용 startRow,endRow//
	public List<Group> projectList(String pageNum) {
		if( pageNum!=null) {
			Paging paging = new Paging(groupDao.projectTotCnt(), pageNum, 12, 10);
			Group group = new Group();
			group.setStartRow(paging.getStartRow());
			group.setEndRow(paging.getEndRow());
			return groupDao.projectList(group);
		}
		System.out.println(pageNum);
		System.out.println("projectList 오류");
		return null;
	}
	
	@Override //프로젝트 전체 수//
	public int projectTotCnt() {
		return groupDao.projectTotCnt();
	}


	/////////////////////////register.do//////////////////////////////////////////
	@Override //그룹 등록(사용언어 배열로 받아 for문 돌림)//
	public int registerGroup(Group group, String[] glanguage, HttpSession session) {
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
	    String mid = null;
	    Member member = (Member)session.getAttribute("member");
	    if(member!=null) {
	    	mid = member.getMid();
	    }
	    group.setMid(mid);
	    groupDao.registerGroup(group);
		return groupDao.insertHistory(group);
	}
	
	/////////////////////////detail.do//////////////////////////////////////////
	@Override //그룹 멤버 정보 전달//
	public List<Group> groupMember(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.groupMember(gid);
		}
		System.out.println(gid);
		System.out.println("groupMember 오류");
		return null;
	}	
	
	@Override //그룹의 상세정보 전달//
	public Group getGroupDetail(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			groupDao.groupHitUp(gid);
			return groupDao.getGroupDetail(gid);
		}
		System.out.println(gid);
		System.out.println("getGroupDetail 오류");
		return null;
	}
	@Override //가입 여부 확인 & 가입시 가입 형태 확인//
	public int joinCheck(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group.setGid(gid);
			group.setMid(mid);
			return groupDao.joinCheck(group); // 가입 이력 있으면 1~3중 리턴
		}
		System.out.println(gid + "///" + mid);
		System.out.println("joinCheck 오류");
		return 500;
	}	
	
	@Override //인기 그룹 출력//
	public List<Group> hitGroup() {
		return groupDao.hitGroup();
	}
	
	/////////////////////////modify.do GET//////////////////////////////////////////
	@Override //그룹 정보 수정을 위한 정보 가져오기(조회수 UP 기능 x)
	public Group getAfterModifyView(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.getGroupDetail(gid);
		}
		System.out.println(gid);
		System.out.println("getAfterModifyView 오류");
		return null;
	}

	/////////////////////////modify.do POST//////////////////////////////////////////
	@Override //그룹 정보 수정//
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
	
	/////////////////////////delete.do //////////////////////////////////////////
	@Override //히스토리에 포기 이력 남김 (gsstatus='4')
	public int deleteHistory(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.deleteHistory(gid);
		}
		System.out.println(gid);
		System.out.println("deleteHistory 오류");
		return 500;
	}

	@Override //등록된 그룹 중도 포기 or 삭제(gcomplete='D') //
	public int deleteGroup(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.deleteGroup(gid);
		}
		System.out.println(gid);
		System.out.println("deleteGroup 오류");
		return 500;
	}

	/////////////////////////join.do //////////////////////////////////////////
	@Override //그룹에 가입 신청 //
	public int joinGroup(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group.setGid(gid);
			group.setMid(mid);
			int joinCnt = groupDao.joinCheckCnt(group);
			if(joinCnt == 0) {
				groupDao.joinGroup(group);
				return 300; //가입 신청 성공시 반환할 임의의 숫자
			} else {
				int joinStatus = groupDao.joinCheck(group);
				return joinStatus; //이미 가입된 상태 -> 0:강퇴자 / 1:신청자 / 2:그룹원 / 3:완료된그룹
			}
		}
		System.out.println(gid+"///"+mid);
		System.out.println("joinGroup 오류");
		return 500;
	}
	
	@Override //특정 그룹에 가입신청 했는지 여부 (가입 미신청시 0, 신청시 1 이상)
	public int joinCheckCnt(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group.setGid(gid);
			group.setMid(mid);
			return groupDao.joinCheckCnt(group);
		}
		System.out.println(gid+"///"+mid);
		System.out.println("joinCheckCnt 오류");
		return 500;
	}	

	/////////////////////////unJoin.do //////////////////////////////////////////
	@Override //그룹 신청 취소 //
	public int unJoinGroup(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group.setGid(gid);
			group.setMid(mid);
			return groupDao.unJoinGroup(group);
		}
		System.out.println(gid+"///"+mid);
		System.out.println("unJoinGroup 오류");
		return 500;
	}
	
	/////////////////////////accept.do //////////////////////////////////////////
	@Override //가입 신청자를 그룹원으로(gstatus = 1 -> 0), 현재멤버 +1, 그룹 최대인원 도달시-> gcomplete='F' 
	public String acceptGroup(int gid, String mid, Achive achive) {
		String alertMsg="";
		String gidTemp = Integer.toString(gid);
		List<Schedule> arrScdId = scheduleDao.getScdIdList(gid);
		if(gidTemp != null && mid != null) {
			Group group = groupDao.memberFullCheck(gid);
			int gpeople = group.getGpeople();
			int gcurpeople = group.getGcurpeople();
			if(gpeople == gcurpeople) {
				alertMsg="그룹 멤버가 모두 모여 더이상 그룹원을 받을 수 없습니다";
				return alertMsg;
			}else if(gpeople - gcurpeople == 1) {
				groupDao.peopleFull(gid);
				alertMsg="모든 그룹원이 모였습니다.";
			}
			if(arrScdId.size() != 0) {
				for(int j=0; j<arrScdId.size(); j++) {
					achive.setScd_id(arrScdId.get(j).getScd_id());
					achive.setMid(mid);
					if(achiveDao.checkAchive(achive) == 0) {					
						achiveDao.insertAchive(achive);
					}
				}
			}
			groupDao.memberPlus(gid);
			group.setGid(gid);
			group.setMid(mid);
			groupDao.acceptGroup(group);
		}
		return alertMsg;
	}
	
	@Override // 현재그룹원(gcurpeople) +1 //
	public int memberPlus(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.memberPlus(gid);
		}
		System.out.println(gid);
		System.out.println("memberPlus 오류");
		return 500;
	}
	
	@Override // 만원 그룹인지 체크(gcomplete가 f인지)//
	public Group memberFullCheck(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.memberFullCheck(gid);
		}
		System.out.println(gid);
		System.out.println("memberFullCheck 오류");
		return null;
	}
	
	@Override //그룹 gcomplete 'N' -> 'F' //
	public int peopleFull(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.peopleFull(gid);
		}
		System.out.println(gid);
		System.out.println("peopleFull 오류");
		return 500;
	}
	
	/////////////////////////memberOut.do //////////////////////////////////////////
	@Override //그룹원 강퇴(gstatus = 2 -> 0), 현재멤버 -1, 만원그룹인경우 비만원으로 
	public int memberOut(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group = groupDao.memberFullCheck(gid);
			int gpeople = group.getGpeople();
			int gcurpeople = group.getGcurpeople();
			if(gpeople == gcurpeople) {
				groupDao.peopleUnFull(gid);
			}
			groupDao.memberMinus(gid);
			group.setGid(gid);
			group.setMid(mid);
			return groupDao.memberOut(group);
		}
		System.out.println(gid+"////"+mid);
		System.out.println("memberOut 오류");
		return 500;
	}
	
	@Override // 현재그룹원(gcurpeople) -1 //
	public int memberMinus(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.memberMinus(gid);
		}
		System.out.println(gid);
		System.out.println("memberMinus 오류");
		return 500;
	}

	@Override //그룹 gcomplete 'F' -> 'N' //
	public int peopleUnFull(int gid) { 
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.peopleUnFull(gid);
		}
		System.out.println(gid);
		System.out.println("peopleUnFull 오류");
		return 500;
	}

	/////////////////////////complete.do //////////////////////////////////////////
	@Override //특정 그룹 완료(신청자 삭제, 그룹 히스토리의 그룹원 상태 2->3로 변경, 그룹 gcomplete 'F' or 'N' -> 'C')//
	public int completeGroup(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			groupDao.joinDelete(gid);
			groupDao.historyComplete(gid);
			groupDao.completeGroup(gid);
		}
		System.out.println(gid);
		System.out.println("completeGroup 오류");
		return 500;
	}

	/////////////////////////memberInfo.do //////////////////////////////////////////
	@Override //특정 그룹 가입 신청자 리스트//
	public List<Group> joinList(int gid) {
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null) {
			return groupDao.joinList(gid);
		}
		System.out.println(gid);
		System.out.println("joinList 오류");
		return null;
	}
	
	/////////////////////////   ??????   //////////////////////////////////////////
	
	
	@Override
	public String startDate(int gid) {
		return groupDao.startDate(gid);
	}

	@Override
	public String endDate(int gid) {
		return groupDao.endDate(gid);
	}




	/////////////////////////달성도 insert용//////////////////////////////////////////
	@Override
	public List<Group> getMemberId(int gid) {
		return groupDao.getMemberId(gid);
	}

	@Override
	public List<Group> myStudyList(String mid, String pageNum) {
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		Paging paging = new Paging(groupDao.totCntMyStudy(mid), pageNum, 12, 10);
		System.out.println(paging);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.myStudyList(group, mid);
	}

	@Override
	public List<Group> myProjectList(String mid, String pageNum) {
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		Paging paging = new Paging(groupDao.totCntMyProject(mid), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.myProjectList(group, mid);
	}

	@Override
	public List<Group> myHistory(String mid, String pageNum) {
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		Paging paging = new Paging(groupDao.totCntMyHistory(mid), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.myHistory(group, mid);
	}

	@Override
	public int totCntMyStudy(String mid) {
		// TODO Auto-generated method stub
		return groupDao.totCntMyStudy(mid);
	}

	@Override
	public int totCntMyProject(String mid) {
		// TODO Auto-generated method stub
		return groupDao.totCntMyProject(mid);
	}

	@Override
	public int totCntMyHistory(String mid) {
		// TODO Auto-generated method stub
		return groupDao.totCntMyHistory(mid);
	}
	
//	@Override
//	public int groupLeader(HttpSession session) {
//		// 세션 객체에서 "member" 속성의 값을 가져오기
//		Object memberObj = session.getAttribute("member");
//		String mid="";
//		// 가져온 값을 원하는 데이터 타입으로 형변환
//		if (memberObj != null && memberObj instanceof Member) {
//		    Member member = (Member) memberObj;
//		    mid = member.getMid(); // Member 클래스에서 id 필드에 해당하는 getter 메서드를 사용하여 id 값을 가져옴
//		    // id 값 사용
//		}
//		return groupDao.groupLeader(mid);
//	}

}
