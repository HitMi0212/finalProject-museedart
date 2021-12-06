package kr.or.member.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;



import kr.or.member.vo.Member;


@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}
	public Member selectOneMemberId(String memberId) {
		Member m = sqlSession.selectOne("member.selectOneId",memberId);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
	public Member selectOneMemberEmail(String memberEmail) {
		Member m = sqlSession.selectOne("member.selectOneEmail",memberEmail);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
	public Member selectOneMemberPw(String memberPassword) {
		Member m = sqlSession.selectOne("member.selectOnePw",memberPassword);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
}

