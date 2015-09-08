package com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;
import com.entity.BoardDTO;


public class BoardRetrieveCommand implements BoardCommand {

	/*
	 * FrontController 에서 해야 할 일을 따로 뽑아옴
	 * 따라서 HttpServletRequest, HttpServletResponse 가 필요
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String num = request.getParameter("num");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.retrieve(num);
		
		request.setAttribute("retrieve", dto);
	}
	
}
