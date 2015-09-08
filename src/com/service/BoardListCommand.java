package com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;
import com.entity.BoardDTO;

/*
 * 게시판 목록 보기 비즈니스 로직 처리 클래스
 */

public class BoardListCommand implements BoardCommand {

	/*
	 * FrontController 에서 해야 할 일을 따로 뽑아옴
	 * 따라서 HttpServletRequest, HttpServletResponse 가 필요
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.list();
		
		// list.jsp 에서 List<BoardDTO>를 보여준다.
		// 3가지 scope 중에 선택하여 저장	.
		
		request.setAttribute("list", list);
		
	}
	
}
