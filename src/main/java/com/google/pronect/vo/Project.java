package com.google.pronect.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {
	private int 	pid;
	private String 	mid;
	private String 	ptitle;
	private String 	pcontent;
	private int 	ppeople;
	private String 	planguage1;
	private String 	planguage2;
	private String 	planguage3;
	private String 	pdev;
	private String 	pdesign;
	private String 	pm;
	private Date 	prdate;
	private Date 	psdate;
	private Date 	pfdate;
	private int 	phit;
	private String 	ploc;
	private String 	pcomplete;
	private int 	startRow; 	//페이징 처리를 위한 속성 변수
	private int 	endRow;		//페이징 처리를 위한 속성 변수
}
