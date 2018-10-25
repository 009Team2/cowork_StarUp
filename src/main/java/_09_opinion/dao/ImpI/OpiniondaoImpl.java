package _09_opinion.dao.ImpI;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _00_init.util.HibernateUtil;
import _09_opinion.dao.OpinionDao;
import _09_opinion.model.OpinionBean;

@Repository
public class OpiniondaoImpl implements OpinionDao{
	@Autowired
	SessionFactory factory;
	
	public OpiniondaoImpl(){
	}

	@Override
	public int saveOpinion(OpinionBean op){
		int count = 0;
		Session session = factory.getCurrentSession();
		session.save(op);
		count++;
		return count;		
	}
	
	@Override
	public int deleteOpinion(int no) {
		System.out.println("OpinionDAO:delete()");
		int n = 0;
		OpinionBean bean = new OpinionBean();
		bean.setOpinionId(no);
		Session session = factory.getCurrentSession();
		session.delete(bean);
		return n;
	}
	//查詢所有紀錄
	/* (non-Javadoc)
	 * @see _09_opinion.dao.ImpI.OpinionDao#getAllOpinionBean()
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<OpinionBean>getAllOpinionBean(){
		System.out.println("getAllOpinionBean()");
		List<OpinionBean>allOpinionBean=new ArrayList<OpinionBean>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx =null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("From OpinionBean");
			allOpinionBean = query.getResultList();
			tx.commit();
		}catch(Exception e) {
			if(tx!=null)tx.rollback();
			System.out.println(e.getMessage());
		}finally {
			session.close();
		}
		return allOpinionBean;
		
	}
}
