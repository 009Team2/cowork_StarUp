package _06_works.dao.Impl;

import java.sql.Blob;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _06_works.dao.WorksDao;
import _06_works.model.WorksBean;

@Repository
public class WorksDaoImpl implements WorksDao {
	private static final long serialVersionUID = 1L;
	
	
	//建立工廠
	@Autowired
	SessionFactory factory;
	
	//新增一筆資料

	@Override
	public int saveWorks(WorksBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		return ++n;
	}
	
	//查詢一筆資料
	@Override
	public WorksBean queryWorks(int works_Id)  {
		WorksBean bean = null;
		Session session = factory.getCurrentSession();
		bean = session.get(WorksBean.class, works_Id);
		return bean;
	}
	//修改一筆資料(修改圖片)

	@Override
	public int updateWorks(WorksBean bean, long sizeInBytes, long sizeInBytes_1, long sizeInBytes_2) {
		int n = 0;
		String hql = "UPDATE WorksBean SET " 
				+ " worksName=:worksName,  worksIntro=:worksIntro,  worksImgName=:worksImgName, WorksImg = :WorksImg, "
				+ "caption_1 = :caption_1, detail_1=:detail_1, captionImgName_1=:captionImgName_1, captionImg_1=:captionImg_1,"
				+ "caption_2 = :caption_2, detail_2=:detail_2, captionImgName_2=:captionImgName_2, captionImg_2=:captionImg_2";
		if (sizeInBytes == -1 ||sizeInBytes_1 == -1||sizeInBytes_2 == -1) {
			n = updateWorks(bean);
			return n;
		}
		
		Session session = factory.getCurrentSession();		
		n = session.createQuery(hql).setParameter("worksName", bean.getWorksName())
									.setParameter("worksIntro", bean.getWorksIntro())
									.setParameter("worksImgName", bean.getWorksImgName())
									.setParameter("WorksImg", bean.getWorksImg())
									.setParameter("caption_1", bean.getCaption_1())
									.setParameter("detail_1", bean.getDetail_1())
									.setParameter("captionImgName_1", bean.getCaptionImgName_1())
									.setParameter("captionImg_1", bean.getCaptionImg_1())
									.setParameter("caption_2", bean.getCaption_2())
									.setParameter("detail_2", bean.getDetail_2())
									.setParameter("captionImgName_2", bean.getCaptionImgName_2())
									.setParameter("captionImg_2", bean.getCaptionImg_2())
									.executeUpdate();
		return n;
	}
	

	@Override
	public int updateWorks(WorksBean bean) {
		int n = 0;
		String hql = "UPDATE WorksBean SET " 
				+ " worksName=:worksName,  worksIntro=:worksIntro, "
				+ "caption_1 = :caption_1, detail_1=:detail_1,"
				+ "caption_2 = :caption_2, detail_2=:detail_2";	
		
		Session session = factory.getCurrentSession();		
		n = session.createQuery(hql).setParameter("worksName", bean.getWorksName())
									.setParameter("worksIntro", bean.getWorksIntro())
									.setParameter("caption_1", bean.getCaption_1())
									.setParameter("detail_1", bean.getDetail_1())
									.setParameter("caption_2", bean.getCaption_2())
									.setParameter("detail_2", bean.getDetail_2())
									.executeUpdate();
		return n;
	}


	//刪除一筆資料
}