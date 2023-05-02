package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.Nboard;
import com.google.pronect.vo.Qboard;

public interface NboardService {
	public List<Nboard> nboardList(Nboard nboard, String pageNum);
	public int totCntNboard(Nboard nboard);
	public int writeNboard(Nboard nboard, MultipartHttpServletRequest mRequest, HttpServletRequest request);
	public Nboard contentNboard(int nid);
	public int modifyNboard(Nboard nboard, MultipartHttpServletRequest mRequest);
	public int deleteNboard(int nid);
}
