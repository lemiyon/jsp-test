package com.cdg.study.dao;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.cdg.study.entity.BoardDTO;



public class BoardDAOTest {

	private BoardDAO dao;
	
	@Before
	public void setUp() throws Exception {
		dao = new BoardDAO();
	}
	
	@Test
	public void testWrite() throws Exception {
		//Given
		BoardDTO dto = new BoardDTO();
		dto.setNum(0);
		dto.setAuthor("홍길동");
		dto.setTitle("테스트입니다");
		dto.setContent("내용내용");
		dto.setReadcnt(0);
		dto.setWriteday("20150910");

		//When
		int actual = dao.write(dto);

		//Then
		assertEquals(1, actual);
	}
	
	@Test
	public void testRetrieve() throws Exception {
		//Given
		BoardDTO dto = new BoardDTO();
		dto.setNum(0);
		dto.setAuthor("홍길동");
		dto.setTitle("테스트입니다");
		dto.setContent("내용내용");
		dto.setReadcnt(0);
		dto.setWriteday("20150910");

		//When
		BoardDTO actual = dao.retrieve("0");

		//Then
		assertNotNull(actual);
		assertEquals(dto, actual);
	}
}
