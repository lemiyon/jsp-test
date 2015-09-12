package com.cdg.study.dao;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Optional;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cdg.study.entity.BoardDTO;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	private final static String DATA_FILE_PATH = "data.json";
	
	
//	static SqlSessionFactory sqlSessionFactory;
	// sqlSessionFactory, SqlSession
//	static {
//		String resource = "Configuration.xml";
//		InputStream inputStream = null;
//		try {
//			inputStream = Resources.getResourceAsStream(resource);
//		} catch (IOException e) {
//		}
//		
//		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//	}
	
	private static ObjectMapper objectMapper;
	
	static {
		objectMapper = new ObjectMapper();
	}

	// 글 목록 보기
	public List<BoardDTO> list() throws Exception {
		return objectMapper.readValue(new File(DATA_FILE_PATH), new TypeReference<List<BoardDTO>>(){});
	}

	// 글쓰기
	public int write(BoardDTO dto) throws Exception {
		List<BoardDTO> boardDTOList = list();
		boardDTOList.add(dto);
		
		String jsonString = objectMapper.writeValueAsString(boardDTOList);

		FileUtils.writeStringToFile(new File(DATA_FILE_PATH), jsonString);
			
		return 1;
	}

	// 글 자세히 보기
	public BoardDTO retrieve(String num) throws Exception {

		int boardNum = Integer.parseInt(num);
		
		List<BoardDTO> boardDTOList = list();
		
		BoardDTO result = boardDTOList.stream().filter(x -> x.getNum() == boardNum).findFirst().get();
			
		return result;
	}

	// 글 수정하기
	public int update(BoardDTO dto) throws Exception {
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
	public int delete(String num) throws Exception {
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
	public List<BoardDTO> search(String searchName, String searchValue) throws Exception {

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
