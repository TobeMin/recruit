package com.recruit.service;

import java.util.List;

import com.recruit.dao.gen.model.ComResume;





public interface ResumeService {

	public boolean saveResume(ComResume user);
	
	public List<ComResume> findCompanyNews(Integer comId);
	
	public boolean updateResumeLook(ComResume comResume);

}
