package kr.or.resume.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.resume.dao.ResumeDao;
import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumeTbl;

@Service
public class ResumeService {

	@Autowired
	private ResumeDao dao;

	public int insertResume(Resume r, ArrayList<ResumeTbl> list) {
		int resumeResult = dao.insertResume(r);
		int fileResult = 0;
		if(resumeResult>0) {
			int ResumeNo = dao.selectBoardNo(); // 방금 인설트한 보드넘버 가져오기
			for(ResumeTbl rt : list) {
				rt.setResumeNo(ResumeNo);
				fileResult += dao.insertResumeTbl(rt);
			}
		}else {
			return -1;
		}	
		return fileResult;
	}
}
