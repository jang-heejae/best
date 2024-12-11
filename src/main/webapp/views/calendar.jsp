<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="utf-8"/>
  <script src="https://kit.fontawesome.com/6282a8ba62.js" crossorigin="anonymous"></script>
  <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>

  <style>
  :root{
      --primary-color: #30005A;
      --secondary-color: #8B6AA7;
      --accent-color: #E9396B;
      
   }
  #calendar1 {
    width: 80%; 
    margin: 0 0 0 0; 
    background-color: #ffffff;
    padding: 20px; 
    border-radius: 8px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border: 2px solid #30005A;
  }
    .dashboard-body{
       margin-left: 14vw;
       width: 85vw;
       margin-top: 7vh;
       flex-wrap: wrap;
       padding: 2vh;
       color: var(--primary-color);
       border: 1px solid black;
       height: 92%;
       display: flex;
       flex-direction: column;
       align-content: center;
       align-items: flex-start;
       justify-content: center;
   }
  /* 시계 스타일 */
  #clock {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center; 
  }
  #container{
  	display: flex;
  	flex-direction: row;
  	justify-content: center;
  	width: 90%;
  	height: 80%;
  	
  }
  #todo_container {
    border: 2px solid #30005A;
    border-radius: 8px; 
    background-color: rgba(255,255,255,0.4);
    margin: 0 100px;
    width: 30%;
    overflow-y: auto; /* 넘칠 경우 스크롤 표시 */

  }
  #cur-date-wrapper{
  	background-color: var(--primary-color);
  	border-radius: 3px;
  
  }
  #cur_date{
  	text-align: center;
    color: #FFFFFF;
  	font-size: 10px;
  	margin: 0;
  	padding: 15px;
  	font-size: 20px;
  }
  
  #todoform{
  	text-align: center;
  }
  

#todoform input {
    text-align: center;
    background-color: rgba(255, 255, 255, 0.7);
    color: var(--primary-color);
    font-size: 14px;
    width: 90%;
    border: 1px solid var(--primary-color);
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
}
  
  .color-option {
    width: 24px;
    height: 24px;
    border-radius: 50%;
    cursor: pointer;
    border: 2px solid transparent;
  }
  .fc-event {
    display: block;
    padding: 10px;
    margin: 10px 0;
    border-radius: 3px;
    cursor: grab;
    font-weight: bold;
    text-align: center;
  }
  .fc-event.dragging {
    opacity: 0.5;
    background-color: #2c6ba0;
  }
  #color-picker {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
  }
  .color-option.selected {
    border: 2px solid black;
  }
   .fc-event-time,.fc-event-title{
  	color: black;
  } 
  
  
  </style>
</head>
<body class="bg-theme bg-theme1">
 <jsp:include page="header.jsp"></jsp:include>
 	<div class="dashboard-body">
 		<h2 id="clock">00:00:00</h2>
 		
 		<div id="container">
 	    	<div id="calendar1"></div> <!-- 캘린더가 표시될 영역 -->
 	    	<div id="todo_container">
 	    		<div id="cur-date-wrapper">
 	    			<p id="cur_date">일정</p>
 	    		</div>
 	    						
				<div id="color-picker">
				    <span class="color-option" style="background-color: #3788d8;" data-color="#3788d8"></span>
				    <span class="color-option" style="background-color: #ff6b6b;" data-color="#ff6b6b"></span>
				    <span class="color-option" style="background-color: #4caf50;" data-color="#4caf50"></span>
				    <span class="color-option" style="background-color: #fbc02d;" data-color="#fbc02d"></span>
				    <span class="color-option" style="background-color: #9c27b0;" data-color="#9c27b0"></span>
				</div>
				<form id="todoform">
				    <input type="text" placeholder="할 일을 입력하세요" />
				    <button type="submit">추가</button>
				</form>
				<div id="todolist">
				
				</div>
 	    	</div>
 	    </div>
 	</div>
</body> 
    <script src="js/todolist.js"></script>
    <script src="js/calendar.js"></script>
    <script src="js/clock.js"></script>

    <script>
		
    </script>
</html>
