package com.kh.final3.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.Item;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

@Repository
public class ApprovalDao {

	public int selectListCount(SqlSessionTemplate ss, HashMap<String, String> map) {
		return ss.selectOne("approvalMapper.selectListCount",map);
	}

	public ArrayList<ApprovalDoc> selectApprovalDocList(SqlSessionTemplate ss, PageInfo pi,HashMap<String, String> map) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)ss.selectList("approvalMapper.selectApprovalDocList",map,rowBounds);
	}

	public ArrayList<ApprovalDoc> approvalMainList(SqlSessionTemplate ss, String status) {
		return (ArrayList)ss.selectList("approvalMapper.approvalMainList",status);
	}

	public ArrayList<DocType> selectEnrollList(SqlSessionTemplate ss, HashMap<String, String> map,PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)ss.selectList("approvalMapper.selectEnrollList",map,rowBounds);
	}

	public ArrayList<Member> selectApproverList(SqlSessionTemplate ss, HashMap<String, String> map) {
		return (ArrayList)ss.selectList("approvalMapper.selectApproverList",map);
	}

	public Approval selectApproval(SqlSessionTemplate ss, int docNo) {
		return ss.selectOne("approvalMapper.selectApproval",docNo);
	}

	public ArrayList<ApprovalAttachment> selectApprovalAttachment(SqlSessionTemplate ss, int docNo) {
		return (ArrayList)ss.selectList("approvalMapper.selectApprovalAttachment", docNo);
	}

	public ApprovalDoc selectApprovalDoc(SqlSessionTemplate ss, int docNo) {
		return ss.selectOne("approvalMapper.selectApprovalDoc", docNo);
	}

	public ArrayList<Item> selectItem(SqlSessionTemplate ss, int docNo) {
		return (ArrayList)ss.selectList("approvalMapper.selectItem", docNo);
	}

	public ArrayList<Leave> selectLeave(SqlSessionTemplate ss, int docNo) {
		return (ArrayList)ss.selectList("approvalMapper.selectLeave", docNo);
	}

	public int updateSecondApprover(SqlSessionTemplate ss, Approval a) {
		return ss.update("approvalMapper.updateSecondApprover",a);
	}

	public int updateSecondReturnReason(SqlSessionTemplate ss, Approval a) {
		return ss.update("approvalMapper.updateSecondReturnReason",a);
	}

	public List<ApprovalDoc> monthData(SqlSessionTemplate ss, ApprovalDoc ad) {
		return ss.selectList("approvalMapper.monthData",ad);
	}

	public int selectEnrollListCount(SqlSessionTemplate ss, HashMap<String, String> map) {
		return ss.selectOne("approvalMapper.selectEnrollListCount", map);
	}
}
