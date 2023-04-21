package com.google.pronect.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Study {
	private int 	sid;
	private String 	mid;
	private String 	stitle;
	private String 	scontent;
	private int 	speople;
	private String 	slanguage1;
	private String 	slanguage2;
	private String 	slanguage3;
	private Date 	srdate;
	private Date 	ssdate;
	private Date 	sfdate;
	private int 	shit;
	private String 	sloc;
	private String 	scomplete;
	private int 	startRow; 	//페이징 처리를 위한 속성 변수
	private int 	endRow;		//페이징 처리를 위한 속성 변수
}
