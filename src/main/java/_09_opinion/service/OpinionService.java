package _09_opinion.service;

import java.util.List;

import _09_opinion.model.OpinionBean;

public interface OpinionService {

	int saveOpinion(OpinionBean op);

	int deleteOpinion(int no);

	List<OpinionBean> getAllOpinionBean();

}