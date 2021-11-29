package kr.or.member.sevice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.dao.MemberDao;
import kr.or.member.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;
	
	
	public Member selectOneMember(Member member) {
//		if(member.getMemberId().isEmpty() || member.getMemberPw().isEmpty()) {//입력 받은 문자열의 길이가 0인 경우
//			throw new IllegalArgumentException("아이디또는 패스워드를 입력해야 합니다."); // 아이디 비밀번호가 비어있는 경우 예외를 발생
//		}
		Member m = dao.selectOneMember(member);
		return m;
	}
}