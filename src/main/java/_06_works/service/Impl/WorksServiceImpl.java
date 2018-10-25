package _06_works.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;

import _06_works.dao.WorksDao;
import _06_works.model.worksBean;
import _06_works.service.WorksService;

public class WorksServiceImpl implements WorksService {
	@Autowired
	WorksDao dao;
	
	public WorksServiceImpl() {}
	
	//新增一筆資料
	@Override
	public int saveWorks(worksBean bean) {
		return dao.saveWorks(bean);
	}
	
	//查詢一筆資料
	@Override
	public worksBean queryWorks(int works_Id)  {
		return dao.queryWorks(works_Id);
	}
	//修改一筆資料(修改圖片)

	@Override
	public int updateWorks(worksBean bean, long sizeInBytes, long sizeInBytes_1, long sizeInBytes_2) {
		return dao.updateWorks(bean, sizeInBytes, sizeInBytes_1, sizeInBytes_2);
	}
	

	@Override
	public int updateWorks(worksBean bean) {
		return dao.updateWorks(bean);
	}
}
