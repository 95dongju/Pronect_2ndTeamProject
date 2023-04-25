package com.google.pronect.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.Fboard;

public interface FboardService {
	public List<Fboard> fboardList(Fboard fboard, String pageNum);
	public int totCntFboard(Fboard fboard);
	public int writeFboard(Fboard fboard, MultipartHttpServletRequest mRequest);
	public Fboard contentFboard(int fid);
	public Fboard fboardModifyReplyView(int fid);
	public int modifyFboard(Fboard fboard, MultipartHttpServletRequest mRequest);
	public int deleteFboard(int fid);
	public int replyFboard(Fboard fboard, MultipartHttpServletRequest mRequest);
}
