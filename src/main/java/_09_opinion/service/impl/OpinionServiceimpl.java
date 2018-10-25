package _09_opinion.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _09_opinion.dao.OpinionDao;
import _09_opinion.model.OpinionBean;
import _09_opinion.service.OpinionService;

@Service
@Transactional
public class OpinionServiceimpl implements OpinionService{
	@Autowired
	OpinionDao dao;
	
	public OpinionServiceimpl() {}

	@Override
	public int saveOpinion(OpinionBean op) {
		return dao.saveOpinion(op);
	}

	@Override
	public int deleteOpinion(int no) {
		 return dao.deleteOpinion(no);
	}

	@Override
	public List<OpinionBean> getAllOpinionBean(){
		return dao.getAllOpinionBean();
	}

}
