package _06_works.dao;

import _06_works.model.worksBean;

public interface WorksDao {

	//新增一筆資料
	int saveWorks(worksBean bean);

	//查詢一筆資料
	worksBean queryWorks(int works_Id);

	//修改一筆資料(包含修改圖片)
	int updateWorks(worksBean bean, long sizeInBytes, long sizeInBytes_1, long sizeInBytes_2);
	//修改一筆資料(只修改文字)
	int updateWorks(worksBean bean);

}