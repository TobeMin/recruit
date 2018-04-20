package com.recruit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.recruit.dao.gen.mapper.ComResumeMapper;
import com.recruit.dao.gen.model.ComResume;
import com.recruit.service.ResumeService;
@Service
public class ResumeServiceImpl implements ResumeService{
	@Resource
	ComResumeMapper resumeMapper;
	
	@Override
	public boolean saveResume(ComResume user) {
		int i=resumeMapper.insert(user);
		if (i > 0) {
			return true;
		}

		return false;
	}
	
	@Override
	public List<ComResume> findCompanyNews(Integer comId) {
		// TODO Auto-generated method stub
		
		return resumeMapper.selectByCompanyId(comId);
	}

	@Override
	public boolean updateResumeLook(ComResume comResume) {
		// TODO Auto-generated method stub
		if(resumeMapper.updateByPrimaryKeySelective(comResume)>0) {
			return true;
		}else {
			return false;
		}
	}

}
