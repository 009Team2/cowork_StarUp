package _06_works.dao;

import _06_works.model.WorksBean;

public interface WorksDao {

	//新增一筆資料
	int saveWorks(WorksBean bean);

	//查詢一筆資料
	WorksBean queryWorks(int works_Id);

	//修改一筆資料(包含修改圖片)
	int updateWorks(WorksBean bean, long sizeInBytes, long sizeInBytes_1, long sizeInBytes_2);
	//修改一筆資料(只修改文字)
	int updateWorks(WorksBean bean);

}