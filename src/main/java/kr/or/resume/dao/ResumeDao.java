package kr.or.resume.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumeTbl;

@Repository
public class ResumeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertResume(Resume r) {
		int result = sqlSession.insert("resume.insertResume",r);
		return result;
	}

	public int selectBoardNo() {
		int result = sqlSession.selectOne("resume.selectResumeNo");
		return result;
	}

	public int insertResumeTbl(ResumeTbl rt) {
		int result = sqlSession.insert("resume.insertResumeTbl",rt);
		return result;
	}

	public ArrayList<Resume> selectResumeList(int requritNo) {
		List<Resume> list = sqlSession.selectList("resume.selectResumeList",requritNo);
		return (ArrayList<Resume>)list;
	}

	public Resume selectOneResume(int resumeNo) {
		Resume r = sqlSession.selectOne("resume.selectOneResume",resumeNo);
		return r;
	}

	public ArrayList<ResumeTbl> selectFileList(int resumeNo) {
		List<ResumeTbl> list = sqlSession.selectList("resume.selectFileList",resumeNo);
		return (ArrayList<ResumeTbl>)list;
	}
}
