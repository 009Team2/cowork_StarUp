package _09_opinion.dao;

import java.util.List;

import _09_opinion.model.OpinionBean;

public interface OpinionDao {

	int saveOpinion(OpinionBean op);

	//刪除紀錄
	int deleteOpinion(int no);

	//查詢所有紀錄
	List<OpinionBean> getAllOpinionBean();

}