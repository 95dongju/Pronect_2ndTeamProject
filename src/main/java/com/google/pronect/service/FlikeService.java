package com.google.pronect.service;

import com.google.pronect.vo.Flike;

public interface FlikeService {
	public int findLike(Flike flike);
	public int getLike(Flike flike);
	public int likeUp(Flike flike);
	public int likeDown(Flike flike);
}
