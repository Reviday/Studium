package com.studium.madang.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.studium.madang.model.dao.ShareMadangDao;
import com.studium.madang.model.vo.ShareMadang;

public class ShareMadangService {

private ShareMadangDao dao=new ShareMadangDao();
	
	public List<ShareMadang> selectMadangList() {
		Connection conn=getConnection();
		List<ShareMadang> list=dao.selectMadangList(conn);
		close(conn);
		return list;
	}
}
