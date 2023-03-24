<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/header.jsp"%>

  
    
    <script type="text/javascript">
        $(function(){
          $(".title-div").eq(0).click(function(e){
            e.preventDefault();
            $(".ui-accordion-view").eq(0).toggle(10);
          });

          $(".title-div").eq(1).click(function(e){
            e.preventDefault();
            $(".answer").eq(1).toggle('visible');
          });

          $(".title-div").eq(2).click(function(e){
            e.preventDefault();
            $(".answer").eq(2).toggle('visible');
          });

          $(".title-div").eq(3).click(function(e){
            e.preventDefault();
            $(".answer").eq(3).toggle('visible');
          });

          $(".title-div").eq(4).click(function(e){
            e.preventDefault();
            $(".answer").eq(4).toggle('visible');
          });
        });
    </script>

   
   
     
            
    
</body>
</html>