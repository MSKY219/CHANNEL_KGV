package com.kh.kgv.common.aop;

import org.aspectj.lang.annotation.Pointcut;

public class CommonPointcut {

	// 회원 서비스용 Pointcut
//		@Pointcut("execution(* edu.kh.comm.member..*Impl.*(..))")
		@Pointcut("execution(* com.kh.kgv.login..*Impl.*(..))")
		public void userPointcut() {} 
		
		// 모든 ServiceImpl 클래스용 Pointcut
		@Pointcut("execution(* com.kh.kgv..*Impl.*(..))")
		public void implPointcut() {}
}
