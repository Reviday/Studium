package com.studium.index.model.service;

import java.util.List;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;
import com.studium.index.model.dao.IndexDao;
import com.studium.story.model.vo.Story;
import java.sql.Connection;


public class IndexService {
	private IndexDao dao=new IndexDao();
	
	public List<Story> selectReview(){
		Connection conn=getConnection();
		List<Story> list= dao.selectReview(conn);
		close(conn);
		return list;
	}
	
	
	
	
}
