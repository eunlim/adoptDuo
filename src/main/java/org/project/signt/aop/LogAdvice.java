package org.project.signt.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component // 스프링에서 관리하는 bean
@Aspect // aop bean 두개의 어노테이션이 들어가야한다.
public class LogAdvice {

	//loggin을 위한 코드
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	@Around("execution(* org.project.signt.controller..*Controller.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {

		long start = System.currentTimeMillis();
		Object result = joinPoint.proceed(); // proceed를 중심 전후로 나뉜다
		
//		String type = joinPoint.getSignature().getDeclaringTypeName(); //호출한 클래스 이름 -> 현재는 Controller만 호출하기 때문에 구분하지 않는다
//		if(type.indexOf("Controller") > -1){ // type 구분을 하기 위함 -> Controller, Service, Dao를 나눌수도 있다
//			name = "Controller"; 
//		}
		
		//로그생성
		//logger.info("메소드 이름 -> "+ joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName() + "()");
		//logger.info("변수내용 -> "+ Arrays.toString(joinPoint.getArgs())); // 데이터가 너무 많으면 출력이 너무 오래걸리고 다운됨
		
		long end = System.currentTimeMillis();
		long time = end - start;
		
		logger.info("실행시간 -> "+ time);
		
		return result;
	}
	
}
