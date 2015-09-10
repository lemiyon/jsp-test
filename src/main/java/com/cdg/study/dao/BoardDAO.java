package com.cdg.study.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.hsqldb.Server;
import org.hsqldb.jdbc.jdbcDataSource;
import org.hsqldb.jdbc.jdbcDataSourceFactory;
import org.hsqldb.util.DatabaseManager;

import com.cdg.study.entity.BoardDTO;

/*
 create table board
 ( num number(4) primary key,
 author varchar2(20) not null,
 title varchar2(20) not null,
 content varchar2(4000),
 writeday date default sysdate,
 readcnt number(4) default 0 );

 create sequence board_seq;

 */

public class BoardDAO {

	static SqlSessionFactory sqlSessionFactory;
	// sqlSessionFactory, SqlSession
	static {
		String resource = "Configuration.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		new Server().start();
		
//		jdbcDataSource dataSource = new jdbcDataSource();
//		dataSource.set
//		dataSource.setDatabase("jdbc:hsqldb:file:create_table.sql");
//		TransactionFactory transactionFactory = new JdbcTransactionFactory();
//		Environment environment = new Environment("development", transactionFactory, dataSource);
//		Configuration configuration = new Configuration(environment);
//		configuration.addMapper(BlogMapper.class);
//		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);
		
		
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	// 글 목록 보기
	public List<BoardDTO> list() {

		List<BoardDTO> list = null;

		SqlSession session = sqlSessionFactory.openSession();

		try {
			list = session.selectList("list");
		} finally {
			session.close();
		}

		return list;

	}

	// 글쓰기
	public int write(BoardDTO dto) {
		int n = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try {
			n = session.insert("insert", dto);
			session.commit();
		} finally {
			session.close();
		}

		return n;
	}

	// 글 자세히 보기
	public BoardDTO retrieve(String num) {

		readCnt(num);

		BoardDTO dto = null;
		SqlSession session = sqlSessionFactory.openSession();

		try {
			dto = session.selectOne("selectByNum", Integer.parseInt(num));
			session.commit();
		} finally {
			session.close();
		}

		return dto;
	}

	// 조회수 증가
	public void readCnt(String num) {
		int n = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try {
			n = session.update("readCnt", Integer.parseInt(num));
			session.commit();
		} finally {
			session.close();
		}

	}

	// 글 수정하기
	public int update(BoardDTO dto) {
		int n = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try {
			n = session.update("update", dto);
			session.commit();
		} finally {
			session.close();
		}

		return n;
	}

	// 글 삭제하기
	public int delete(String num) {
		int n = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try {
			n = session.delete("delete", Integer.parseInt(num));
			session.commit();
		} finally {
			session.close();
		}

		return n;
	}

	// 검색
	public List<BoardDTO> search(String searchName, String searchValue) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		/*String key = "author";
		if("title".equals(searchName))
			key = "title";*/
		
		List<BoardDTO> list = null;

		SqlSession session = sqlSessionFactory.openSession();

		try {
			list = session.selectList("search", map);
		} finally {
			session.close();
		}

		return list;

	}

}
