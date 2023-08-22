package com.kh.final3.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.final3.alert.model.vo.Alert;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.Item;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;


public interface ApprovalService {
		
		//전체 결재문서 수
		int selectListCount(HashMap<String, String> map);
		
		//결재문서 조회
		ArrayList<ApprovalDoc> selectApprovalDocList(PageInfo pi, HashMap<String, String> map);
		
		//홈 결재문서 리스트 조회
		ArrayList<ApprovalDoc> approvalMainList(String status);
		
		//결재문서작성 리스트 수 
		int selectEnrollListCount(HashMap<String, String> map);
		
		//결재문서 종류 조회
		ArrayList<DocType> selectEnrollList(HashMap<String, String> map, PageInfo pi);
		
		//결재자 조회
		ArrayList<Member> selectApproverList(HashMap<String, String> map);
		
		//구매 품의서 
		int insertItem(ArrayList<Item> iList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//휴가계
		int insertLeave(ArrayList<Leave> leaveList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//승인자 조회
		Approval selectApproval(int docNo);
		
		//첨부파일 조회
		ArrayList<ApprovalAttachment> selectApprovalAttachment(int docNo);
		
		//결재문서 상세 조회
		ApprovalDoc selectApprovalDoc(int docNo);
		
		//구매품의서 상세 조회
		ArrayList<Item> selectItem(int docNo);
		
		//휴가계 상세 조히
		ArrayList<Leave> selectLeave(int docNo);

		//중간결재자 반려사요
		int updateSecondReturnReason(Approval a);
		
		//최종결재자 반려사유
		int updateLastReturnReason(Approval a, ApprovalDoc ad);
		
		//중간결재자 승인
		int updateSecondApprover(Approval a);
		
		//최종결재자 승인
		int updateLastApprover(Approval a,ApprovalDoc ad);
		
		//월별 데이터
		List<ApprovalDoc> monthData(ApprovalDoc ad);
		
		

}
