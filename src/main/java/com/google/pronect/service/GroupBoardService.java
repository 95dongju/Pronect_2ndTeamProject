package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.GroupBoard;

public interface GroupBoardService {
	public List<GroupBoard> groupBoardList(GroupBoard groupboard, String boardpageNum, Model model);
	public int totCntGroupBoard(GroupBoard groupboard);
	public int writeGroupBoard(GroupBoard groupboard, MultipartHttpServletRequest mRequest, HttpServletRequest request);
	public GroupBoard modifyViewGroupBoard(int group_bid);
	public GroupBoard detailGroupBoard(int group_bid);
	public int modifyGroupBoard(GroupBoard groupboard, MultipartHttpServletRequest mRequest, HttpServletRequest request);
	public int deleteGroupBoard(int group_bid);
}
