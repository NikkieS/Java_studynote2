package com.aia.op.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.op.member.service.MemberViewService;

@Controller
public class MemberViewController {
	
	@Autowired
	private MemberViewService viewService;
	
	// http://localhost:8080/op/member/view/12
	@RequestMapping("/member/view/{idx}")
	public String getMemberInfo(@PathVariable("idx") int idx, Model model) {
		
		model.addAttribute("member", viewService.getMemberInfo(idx));
		
		return "member/memberView";
	}
}
