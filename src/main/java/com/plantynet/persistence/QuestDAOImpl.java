package com.plantynet.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.ProhibitVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;

/*  원래방식
@Repository  // 이게 있어야 데이터를 반환할 수 있다.
public class QuestDAOImpl implements QuestDAO {
	
	@Autowired
	private SqlSession sqlSession;   // 마이바티스를 이용하기 위한 기본적인 자바 인터페이스
	private static final String namespace = "com.plantynet.mapper.QuestMapper";
	
	@Override
	public List<QuestYetVO> questYetSelect() {   // 미처리 VO의 데이터를 가져다 mapper와 연동시켜 select
		return  sqlSession.selectList(namespace+".questYetSelect");
	}
	
	@Override
	public List<QuestDoneVO> questDoneSelect() { // 처리 VO
		return  sqlSession.selectList(namespace+".questDoneSelect");
	}
}*/


@Repository
public class QuestDAOImpl implements QuestDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.plantynet.mapper.QuestMapper";

	@Override
	public List<QuestYetVO> questYetSelect() throws Exception {
		return sqlSession.selectList(namespace+".questYetSelect");
	}

	@Override
	public List<QuestDoneVO> questDoneSelect() throws Exception {
		return sqlSession.selectList(namespace+".questDoneSelect");
	}
	
	@Override
	public QuestYetVO questAnswerSelect(Integer quest_no) throws Exception {
		return sqlSession.selectOne(namespace+".questAnswerSelect", quest_no);
	}
}