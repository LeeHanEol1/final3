package com.kh.final3.todo.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@Component
public class Todo {

	private int todoNo;//	TODO_NO	NUMBER
	private int userNo;//	USER_NO	NUMBER
	private String todoContent;//	TODO_CONTENT	VARCHAR2(60 BYTE)
	private String status;//	STATUS	VARCHAR2(1 BYTE)
}
