package kr.or.reading.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.reading.model.vo.Reading;
import kr.or.reading.model.vo.ReadingBlack;

@Repository
public class ReadingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ReadingBlack selectOneBlackList(String memberId) {
		
		return sqlSession.selectOne("reading.selectOneBlackList", memberId);
	}

	public Reading selectOneNum(Reading re) {
		return sqlSession.selectOne("reading.selectOneNum", re);
	}

	public int insertReading(Reading re) {
		
		return sqlSession.insert("reading.insertReading", re);
	}

	public Reading selectOneId(Reading re) {
		return sqlSession.selectOne("reading.selectOneId", re);
	}

	public int reservationCancel(Reading re) {
		return sqlSession.delete("reading.reservationCancel", re);
	}

	
}
