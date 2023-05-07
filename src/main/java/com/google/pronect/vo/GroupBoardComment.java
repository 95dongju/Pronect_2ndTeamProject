package com.google.pronect.vo;

import lombok.NoArgsConstructor;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupBoardComment {
	private int group_cmtid;
	private int group_bid;
	private String mid;
	private String group_board_cmt_content;
	private int group_board_cmt_like;
	private Date group_board_cmt_rdate;
	private int startRow;
	private int endRow;
}
