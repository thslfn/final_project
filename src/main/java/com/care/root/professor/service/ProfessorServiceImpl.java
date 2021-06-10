package com.care.root.professor.service;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.professor.dao.ProfessorDAO;
import com.care.root.professor.dto.GradeInfoDTO;
import com.care.root.professor.dto.MessageDTO;
import com.care.root.professor.dto.ProfessorDTO;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	@Autowired ProfessorDAO pm;
	@Override
	public ArrayList<ProfessorDTO> getJuniorList(String position, String grade) {
		return pm.getJuniorList(position, grade);
	}
	public ArrayList<ProfessorDTO> getSeniorList(String position, String grade) {
		return pm.getSeniorList(position, grade);
	}
	@Override
	public void showGrade(Model model, String lecName) {
		model.addAttribute("gradeInfo", pm.getGradeInfo(lecName)); //성적입력에 넣을 값
	}
	@Override
	public String inputGrade(MultipartHttpServletRequest mul, HttpServletRequest request) {
		GradeInfoDTO dto = new GradeInfoDTO();
		
		Map<String, String> mapScore = new HashMap<String,String>();
	
		//여기서부터 다시 해야함. 스코어가 안 들어감. 자바 콘솔에는 찍히는 데 안 들어간다.
		String[] arrScore = mul.getParameterValues("inputScore");
		String[] arrId = mul.getParameterValues("keyId");
		/* 값은 잘 넘어옴
		System.out.println(arrId[0]);
		System.out.println(arrId[1]);
		System.out.println(arrId[2]);
		System.out.println(arrScore[0]);
		System.out.println(arrScore[1]);
		System.out.println(arrScore[2]);
		*/
		for(int i=0;i<arrId.length;i++) {
			mapScore.put(arrId[i], arrScore[i]);
			System.out.println(mapScore);
			int test01 = Integer.parseInt(arrScore[i]);
			System.out.println(test01);
//			dto.setScore(80);
//			dto.setGrade(convertGrade(80));
			dto.setIdNum(arrId[i]);
			dto.setScore(Integer.parseInt(arrScore[i]));
			dto.setGrade(convertGrade(Integer.parseInt(arrScore[i])));
			pm.saveScore(dto);
		}
		
		/*
		dto.setScore(Integer.parseInt(mul.getParameter("inputScore")));
		dto.setGrade(changeGrade(Integer.parseInt(mul.getParameter("inputScore"))));
		*/
		// int result = pm.saveScore(dto);
		int result = 1;
		MessageDTO mDTO = new MessageDTO();
		mDTO.setResult(result);
		System.out.println(result); //test용
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 저장되었습니다.");
		mDTO.setSuccessURL("/professor/show_grade");
		mDTO.setFailMessage("입력 중 문제가 발생하였습니다.");
		mDTO.setFailURL("/professor/show_grade");
		String message = showMessage(mDTO);
		return message;
	}
	public String convertGrade(int score) {
		//0미만 100초과 밑 문자 오류처리 필요, 잘못 입력했을 때 try catch
			if(score>=95) return "A+";
			else if(score>=90) return "A";
			else if(score>=85) return "B+";
			else if(score>=80) return "B";
			else if(score>=75) return "C+";
			else if(score>=70) return "C";
			else if(score>=60) return "D";
			else return "F";
	}
	public String showMessage(MessageDTO dto) {
		String message = null;
		String path = dto.getRequest().getContextPath();
		if(dto.getResult() >= 1) {
			message = "<script>alert('"+dto.getSuccessMessage()+"');";
			message += "location.href='"+path+dto.getSuccessURL()+"';</script>";
		}else {
			message = "<script>alert('"+dto.getFailMessage()+"');";
			message += "location.href='"+path+dto.getFailURL()+"';</script>";
		}
		return message;
	}
	
	
}
