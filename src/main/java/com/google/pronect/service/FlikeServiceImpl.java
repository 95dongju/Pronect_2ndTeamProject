package com.google.pronect.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.pronect.dao.FlikeDao;
import com.google.pronect.vo.Flike;
import com.google.pronect.vo.Member;
@Service
public class FlikeServiceImpl implements FlikeService {
	@Autowired
	FlikeDao flikeDao;
	@Override
	public int findLike(Flike flike, HttpSession session, Model model) {
		// TODO Auto-generated method stub
		int result = 0;
		Member member = (Member) session.getAttribute("member");
		if(member!=null) {
			flike.setMid(member.getMid());
		}
		try {
			result = flikeDao.findLike(flike);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	@Override
	public int getLike(Flike flike) {
		// TODO Auto-generated method stub
		return flikeDao.getLike(flike);
	}

	@Override
	public int likeUp(Flike flike, HttpSession session, Model model) {
		// TODO Auto-generated method stub
		int result = 0;
		Member member = (Member) session.getAttribute("member");
		if(member!=null) {
			flike.setMid(member.getMid());
		}
		try {
			result = flikeDao.likeUp(flike);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public int likeDown(Flike flike, HttpSession session, Model model) {
		// TODO Auto-generated method stub
		int result = 0;
		Member member = (Member) session.getAttribute("member");
		if(member!=null) {
			flike.setMid(member.getMid());
		}
		try {
			result = flikeDao.likeDown(flike);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

}
