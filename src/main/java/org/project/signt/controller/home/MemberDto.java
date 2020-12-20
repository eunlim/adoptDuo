package org.project.signt.controller.home;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;



public class MemberDto {

	 /*
     * @Valid 어노테이션을 이용해서 model의 값을 지정하는 경우 아래의 방식으로 통해서 데이터 유효성 검증을 진행 할 수 있습니다.
     * @AssertFalse : false 값만 통과 가능
     * @AssertTrue : true 값만 통과 가능
     * @DecimalMax(value=) : 지정된 값 이하의 실수만 통과 가능
     * @DecimalMin(value=) : 지정된 값 이상의 실수만 통과 가능
     * @Digits(integer=,fraction=) : 대상 수가 지정된 정수와 소수 자리수보다 적을 경우 통과 가능
     * @Future : 대상 날짜가 현재보다 미래일 경우만 통과 가능
     * @Past : 대상 날짜가 현재보다 과거일 경우만 통과 가능
     * @Max(value) : 지정된 값보다 아래일 경우만 통과 가능
     * @Min(value) : 지정된 값보다 이상일 경우만 통과 가능
     * @NotNull : null 값이 아닐 경우만 통과 가능
     * @Null : null일 겨우만 통과 가능
     * @Pattern(regex=, flag=) : 해당 정규식을 만족할 경우만 통과 가능
     * 		@Pattern(regexp="^[_0-9a-zA-Z-]+@[0-9a-zA-Z]+(.[_0-9a-zA-Z-]+)*$")
     * @Size(min=, max=) : 문자열 또는 배열이 지정된 값 사이일 경우 통과 가능
     * @Valid : 대상 객체의 확인 조건을 만족할 경우 통과 가능
     */

	int no;

	@Size(min = 3, max = 30, message = "3 ~ 30 자리로 해라")
	String id;

	@Size(min = 8, max = 30, message = "3 ~ 30 자리로 해라")
	String pw;
	
	@Pattern(regexp = "^[가-힣]{2,6}$")
    private String name;



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	

}
