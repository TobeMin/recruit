package com.recruit.util;



 

import javax.servlet.http.HttpServletRequest;



public class PagerUtils {
	
	public static Pager getPager(HttpServletRequest req){
		String page = req.getParameter("page")==null?"1":req.getParameter("page");
		System.out.println("========PagerUtils===page====="+page+"========PagerUtils========");
		
		String rows = req.getParameter("rows")==null?"1":req.getParameter("rows");
		System.out.println("========PagerUtils====rows===="+rows+"========PagerUtils========");

		String[] sort = new String[]{};
		if(req.getParameterValues("sort")!=null){
			sort = req.getParameterValues("sort");
			for(String s:sort) {
				System.out.println("========PagerUtils====sort===="+s+"========PagerUtils========");
			}
		}
		String[] order = new String[]{};
		if(req.getParameterValues("order")!=null){
			order = req.getParameterValues("order");
			for(String s:order) {
				System.out.println("========PagerUtils====order===="+s+"========PagerUtils========");
			}
		}
		Pager pager =  new Pager(page,rows,sort,order,null,"0");
		return pager;
	}

}
