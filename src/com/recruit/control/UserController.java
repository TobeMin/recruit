package com.recruit.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.recruit.dao.gen.model.Company;
import com.recruit.dao.gen.model.Emp;
import com.recruit.dao.gen.model.Info;
import com.recruit.dao.gen.model.User;
import com.recruit.dto.JobDto;
import com.recruit.service.CommondService;
import com.recruit.service.CompanyService;
import com.recruit.service.EmpService;
import com.recruit.service.InfoService;
import com.recruit.service.JobService;
import com.recruit.service.UserService;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;
import com.recruit.util.PagerUtils;




@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	UserService userService;
	
	@Resource
	JobService jobService;

	@Resource
	InfoService infoService;
	@Resource
	CommondService  cService;
	@Resource
	EmpService empService;
	@Resource
	CompanyService companyService;
	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping(value = "/goMain")
	public ModelAndView  goMain() {
		ModelAndView view = new ModelAndView();
		view.setViewName("index");
		return view;
	}
	@RequestMapping(value = "/goCompany")
	public ModelAndView  goCompany() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("user/comRegister");
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goUserInfo") //暂时弃用
	public ModelAndView  goUserInfo(HttpServletRequest req) {
		
		ModelAndView view = new ModelAndView();
		/*
		 * 做个判断，假如数据库找不到用户的个人信息，则跳转到信息填写页面
		 * 否则跳到信息展示页面
		 * */
		User user=(User) req.getSession().getAttribute("user");
		
			if(user.getStatus()==1){
				Emp emp=empService.findByUserId(user.getId());
				if(emp==null||emp.equals(null)) {
					view.setViewName("user/empInfoRegister");
				}else {
					view.setViewName("user/empInfo");
				}
			}else{
				Company company=companyService.findByUid(user.getId());
				if(company==null||company.equals(null)) {
					view.setViewName("user/comInfoRegister");
				}else {
					view.setViewName("user/comInfo");
				}
				
			}

//		view.setViewName("user/userInfo"); 修改密码的页面
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goSuccess")
	public ModelAndView  goSuccess() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("user/registerSuccess");
//		view.setViewName("user/MyJsp");
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/checkUsername")
	public String checkUsername(String  username){
		User user=userService.findByUsername(username);
		
		if(user==null){
			//允许注册
			return "1";
		}else{
			//不允许注册
			return "0";
		}

	}
	
	/**
	 * 保存用户
	 * @return
	 */
	@RequestMapping(value = "/saveUser")
	public ModelAndView  saveUser(User  user,HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
	boolean flag=userService.saveUser(user);
	request.getSession().setAttribute("user", user);
//		if(flag==true){
//			//允许注册
//			if(user.getStatus()==1){
//				view.setViewName("user/empInfoRegister");
//			}else{
//				view.setViewName("user/comInfoRegister");
//			}
//
//		}else{
//			//不允许注册
//			view.setViewName("user/comRegister");
//		}
		view.setViewName("user/registerSuccess");


		return view;
	}
	@ResponseBody
	@RequestMapping(value = "/updateUserInfo")
	public String updateUserInfo(User  user){
		boolean flag=userService.updateUser(user);
		
		if(flag){
			Subject currentUser = SecurityUtils.getSubject();
			currentUser.getSession().setAttribute("user", user);
			return "1";
		}else{
			//不允许注册
			return "0";
		}

		
	}
	@RequestMapping(value = "/goJobList")
	public ModelAndView  goJobList() {
		ModelAndView view = new ModelAndView();
		view.setViewName("job/jobList");
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goJobList2")
	public ModelAndView  goJobList2(String  param) {
		ModelAndView view = new ModelAndView();
		
		System.out.println("======goJobList2======="+param+"======goJobList2=======");
		
		view.addObject("param", param);
		view.setViewName("job/jobList");
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goJobDetail")
	public ModelAndView  goJobDetail(int id) {
		if(id != 0){
			//首先插入简历浏览表
			System.out.println("当前这份工作的id为："+id);
			
		}
		JobDto job=jobService.findByJobId(id);
	    
		ModelAndView view = new ModelAndView();
		view.addObject("job", job);
		view.setViewName("job/jobInfo");
//		view.setViewName("user/MyJsp");
		return view;
	}
	@RequestMapping(value = "/goInfoList")
	public ModelAndView  goInfoList() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("info/listInfo");
//		view.setViewName("user/MyJsp");
		return view;
	}
	@RequestMapping(value = "/goCommond")
	public ModelAndView  goCommond(int id) {
		Info info=infoService.findById(id);
		ModelAndView view = new ModelAndView();
		view.addObject("info", info);
		view.setViewName("info/commond");
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value = "/findCommondById", method = RequestMethod.POST)
	public JqueryDto findCommondById(HttpSession session,
			HttpServletRequest request,int id ) {
		Pager	pager = PagerUtils.getPager(request);
                   
		return cService.findByInfoId(pager, id);
	}
}
