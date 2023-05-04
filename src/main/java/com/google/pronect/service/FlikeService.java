package com.google.pronect.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.google.pronect.vo.Flike;

public interface FlikeService {
	public int findLike(Flike flike, HttpSession session, Model model);
	public int getLike(Flike flike);
	public int likeUp(Flike flike, HttpSession session, Model model);
	public int likeDown(Flike flike, HttpSession session, Model model);
}
