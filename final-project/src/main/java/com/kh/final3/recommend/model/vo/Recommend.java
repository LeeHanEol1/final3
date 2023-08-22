package com.kh.final3.recommend.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Builder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Recommend {
	private int refBno;// REF_BNO NUMBER
	private int refUno;// REF_UNO NUMBER
	private String type;// TYPE VARCHAR2(1 BYTE)
}
