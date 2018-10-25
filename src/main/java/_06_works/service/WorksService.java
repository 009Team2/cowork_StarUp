package _06_works.service;

import _06_works.model.worksBean;

public interface WorksService {
	
	 int saveWorks(worksBean bean);
	
	//查詢一筆資料
	 worksBean queryWorks(int works_Id);
	
	//修改一筆資料(修改圖片)
	 int updateWorks(worksBean bean, long sizeInBytes, long sizeInBytes_1, long sizeInBytes_2);
	
	 //修改一筆資料(修改資料)
	 int updateWorks(worksBean bean);
	
	
}
