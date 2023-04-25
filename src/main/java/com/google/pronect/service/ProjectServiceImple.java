package com.google.pronect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.ProjectDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Project;
@Service
public class ProjectServiceImple implements ProjectService {
	@Autowired
	private ProjectDao projectDao;
	@Override
	public List<Project> projectList(String pageNum) {
		Paging paging = new Paging(projectDao.projectTotCnt(), pageNum, 10, 10);
		Project project = new Project();
		project.setStartRow(paging.getStartRow());
		project.setEndRow(paging.getEndRow());
		return projectDao.projectList(project);
	}

	@Override
	public int projectTotCnt() {
		return projectDao.projectTotCnt();
	}

	@Override
	public int projectGroupLeader(String mid) {
		return projectDao.projectGroupLeader(mid);
	}
	
	@Override
	public int registerGroup(Project project) {
		String mid = project.getMid();
		projectDao.registerGroup(project);
		int pid = projectDao.getRegisteredPid(mid);
		return projectDao.insertHistory(pid, mid);
	}

	@Override
	public int getRegisteredPid(String mid) {
		return projectDao.getRegisteredPid(mid);
	}

	@Override
	public int insertHistory(int pid, String mid) {
		return projectDao.insertHistory(pid, mid);
	}

	@Override
	public Project getProjectDetail(int pid) {
		projectDao.projectHitUp(pid);
		return projectDao.getProjectDetail(pid);
	}

	@Override
	public Project getAfterModifyView(int pid) {
		return projectDao.getAfterModifyView(pid);
	}

	@Override
	public int modifyProject(Project project) {
		return projectDao.modifyProject(project);
	}

	@Override
	public int deleteHistory(int pid) {
		return projectDao.deleteHistory(pid);
	}

	@Override
	public int deleteProject(int pid) {
		return projectDao.deleteProject(pid);
	}

	@Override
	public int joinProject(int pid, String mid) {
		return projectDao.joinProject(pid, mid);
	}

	@Override
	public int acceptProject(String mid) {
		return projectDao.acceptProject(mid);
	}

	@Override
	public int completeProject(int pid) {
		return projectDao.completeProject(pid);
	}

}
