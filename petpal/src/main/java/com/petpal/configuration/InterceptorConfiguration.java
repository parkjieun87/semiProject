package com.petpal.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.petpal.interceptor.AdminInterceptor;
import com.petpal.interceptor.MemberInterceptor;
import com.petpal.interceptor.OrderInterceptor;
import com.petpal.interceptor.TestInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {
   
   @Autowired
   private TestInterceptor testInterceptor;
   
   @Autowired
   private MemberInterceptor memberInterceptor;
   
   @Autowired
   private AdminInterceptor adminInterceptor;
   
   @Autowired
   private OrderInterceptor orderInterceptor;
   
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      //인터셉터 등록 메소드
            //- 매개변수에 있는 registry를 사용하여 원하는 인터셉터를 원하는 주소에 설정
            
            //주소 패턴 설정
            //- Spring표현식 사용
            //- *가 1개면 해당 엔드포인트의 모든 내용을 의미
            //- *가 2개면 해당 엔드포인트와 그 이하의 모든 내용을 의미
            
            //[1] TestInterceptor를 모든 주소에 설정하겠다!
            //registry.addInterceptor(testInterceptor)
            //         .addPathPatterns("/**");
                     
            //[2] MemberInterceptor를 다음 페이지에 설정하겠다!
            //- /member로 시작하는 주소 중에서 비회원 페이지 제거
            //- /admin으로 시작하는 주소 전체
            registry.addInterceptor(memberInterceptor)
                     .addPathPatterns(//인터셉터 감시주소
                           "/member/**",//회원 전체
                           "/reply/**",//리뷰
                           "/cart/**"//장바구니 전체
                     
                     )
                     .excludePathPatterns(
                           "/member/join",
                           "/member/joinFinish",
                           "/member/login",
                           "/member/find",
                           "/member/exitFinish"
                           
                     
                  
                     );
            //[3] 관리자 전용 검사 인터셉터
            registry.addInterceptor(adminInterceptor)
                  .addPathPatterns("/admin/**");
            
            //[4] 주문
            registry.addInterceptor(orderInterceptor)
                     .addPathPatterns("/shop/**");

      }
      }
