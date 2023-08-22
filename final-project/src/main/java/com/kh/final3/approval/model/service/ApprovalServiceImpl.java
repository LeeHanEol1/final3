package com.kh.final3.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.alert.model.vo.Alert;
import com.kh.final3.approval.model.dao.ApprovalDao;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.Item;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private ApprovalDao ad;
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public int selectListCount(HashMap<String, String> map) {
		return ad.selectListCount(ss, map);
	}

	@Override
	public ArrayList<ApprovalDoc> selectApprovalDocList(PageInfo pi, HashMap<String, String> map) {
		return ad.selectApprovalDocList(ss,pi, map);
	}
	
	@Override
	public ArrayList<ApprovalDoc> approvalMainList(String status) {
		return ad.approvalMainList(ss,status);
	}

	@Override
	public ArrayList<DocType> selectEnrollList(HashMap<String, String> map,PageInfo pi) {
		return ad.selectEnrollList(ss,map,pi);
	}

	@Override
	public ArrayList<Member> selectApproverList(HashMap<String, String> map) {
		return ad.selectApproverList(ss,map);
	}


	@Override
	@Transactional
	public int insertItem(ArrayList<Item> iList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a) {
		int ApprovalDocResult = ss.insert("approvalMapper.insertApprovalDoc",ad);
		int ApprovalResult = ss.insert("approvalMapper.insertApproval",a);
		int ApprovalAttachmentResult =1;
		int itemResult = 1;
		
		for(ApprovalAttachment aa : atList) {
			ApprovalAttachmentResult *= ss.insert("approvalMapper.insertApprovalAttachment",aa);
		}
		
		for(Item i : iList) {
			itemResult *= ss.insert("approvalMapper.insertItem",i);
		}
		
		int result = ApprovalDocResult*ApprovalResult*ApprovalAttachmentResult*itemResult;
		
		return result;
	}

	@Override
	@Transactional
	public int insertLeave(ArrayList<Leave> leaveList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a) {
		int ApprovalDocResult = ss.insert("approvalMapper.insertApprovalDoc",ad);
		int ApprovalResult = ss.insert("approvalMapper.insertApproval",a);
		int ApprovalAttachmentResult =1;
		int leaveResult = 1;
		
		for(ApprovalAttachment aa : atList) {
			ApprovalAttachmentResult *= ss.insert("approvalMapper.insertApprovalAttachment",aa);
		}
		
		for(Leave l : leaveList) {
			leaveResult *= ss.insert("approvalMapper.insertLeave",l);
		}
		
		int result = ApprovalDocResult*ApprovalResult*ApprovalAttachmentResult*leaveResult;
		
		return result;
	}

	@Override
	public Approval selectApproval(int docNo) {
		return ad.selectApproval(ss,docNo);
	}

	@Override
	public ArrayList<ApprovalAttachment> selectApprovalAttachment(int docNo) {
		return ad.selectApprovalAttachment(ss,docNo);
	}

	@Override
	public ApprovalDoc selectApprovalDoc(int docNo) {
		return ad.selectApprovalDoc(ss,docNo);
	}

	@Override
	public ArrayList<Item> selectItem(int docNo) {
		return ad.selectItem(ss,docNo);
	}
	
	@Override
	public ArrayList<Leave> selectLeave(int docNo) {
		return ad.selectLeave(ss,docNo);
	}
	

	@Override
	public int updateSecondReturnReason(Approval a) {
		int result = ad.updateSecondReturnReason(ss,a);
		return result;
	}
	
	@Override
	@Transactional
	public int updateLastReturnReason(Approval a, ApprovalDoc ad) {
		int result = ss.update("approvalMapper.updateLastReturnReason",a);
		int result2 = ss.update("approvalMapper.updateStatus",ad);
		int result3 = ss.insert("mainMapper.insertReturnAlert", a);
		return result*result2*result3;
	}
	
	@Override
	public int updateSecondApprover(Approval a) {
		return ad.updateSecondApprover(ss,a);
	}

	@Override
	@Transactional
	public int updateLastApprover(Approval a, ApprovalDoc ad) {
		int result = ss.update("approvalMapper.updateLastApprover",a);
		int result2 = ss.update("approvalMapper.updateStatus", ad);
		int result3 = ss.insert("mainMapper.insertAlert", a);
		
		return result * result2 * result3;
	}

	@Override
	public List<ApprovalDoc> monthData(ApprovalDoc ad1) {
		return ad.monthData(ss, ad1);
	}

	@Override
	public int selectEnrollListCount(HashMap<String, String> map) {
		return ad.selectEnrollListCount(ss,map);
	}
}
