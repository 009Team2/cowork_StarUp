package _06_works.service;

import _06_works.model.WorksBean;

public interface WorksService {
	
	 int saveWorks(WorksBean bean);
	
	//查詢一筆資料
	 WorksBean queryWorks(int works_Id);
	
	//修改一筆資料(修改圖片)
	 int updateWorks(WorksBean bean, long sizeInBytes, long sizeInBytes_1, long sizeInBytes_2);
	
	 //修改一筆資料(修改資料)
	 int updateWorks(WorksBean bean);
	
	
}
