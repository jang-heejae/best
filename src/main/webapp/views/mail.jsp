<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="utf-8"/>
  <script src="https://kit.fontawesome.com/6282a8ba62.js" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
/* 반응형 스타일 */
@media screen and (max-width: 1200px) {
    .dash-profile, .drive-info, .year-graph, .dash-calendar, .todoList, .road-info, .iPhone {
        width: 90%;
        height: auto;
        margin-bottom: 20px;
    }

    .dashboard-body {
        margin-left: 5%;
        width: 90%;
        padding: 15px;
    }
}

@media screen and (max-width: 768px) {
    .dash-profile, .drive-info, .year-graph, .dash-calendar, .todoList, .road-info, .iPhone {
        width: 100%;
        height: auto;
        margin-bottom: 15px;
    }

    .dashboard-body {
        margin-left: 2%;
        width: 96%;
        flex-direction: column;
    }
}

@media screen and (max-width: 480px) {
    .dash-profile, .drive-info, .year-graph, .dash-calendar, .todoList, .road-info, .iPhone {
        width: 100%;
        height: auto;
        margin-bottom: 10px;
    }

    .dashboard-body {
        margin-left: 0;
        width: 100%;
        padding: 10px;
    }
}
	:root{
		--primary-color: #30005A;
		--secondary-color: #8B6AA7;
		--accent-color: #E9396B;
		
	}
	.dashboard-body{
	    margin-left: 14vw;
	    width: 85vw;
	    margin-top: 7vh;
	    flex-wrap: wrap;
	    padding: 2vh;
	    color: var(--primary-color);
	    height: 92%;
	    display: flex;
	    flex-direction: column;
	    align-content: center;
	    align-items: flex-start;
	    justify-content: center;
	}
	.maintext{
		display: flex;
		margin-left: 10px;
	}
	.mail{
		color: var(--secondary-color);
		margin-right: 30px;
	    margin-bottom: 40px;
	}
	.mailbox{
		border: 2px solid var(--primary-color);
	    width: -webkit-fill-available;
		height: 80%;
	    border: 2px solid var(--primary-color);
	    border-radius: 10px;
	}
	.mailnav{
		display: flex;
    	justify-content: space-between;
		align-items: center;
		margin: 0 48px;
		padding: 0 5px;
	}
	.opt{
		width: 42%;
		display: flex;
		justify-content: space-between;
	    align-items: center;
	}
	.opt div{
		align-content: center;
	}
	.opt div:not(:last-child){
		font-size: 20px;
		font-weight: bold;
		height: 60px;
	}
	.opt div:hover{
		cursor: pointer;
		border-bottom: 3px solid var(--accent-color);
	}
	.opt div:last-child:hover {
	    border-bottom: none;
	}
	.drop{
	    height: 28px;
	    font-size: 14px;
	    border: 1px solid var(--primary-color);
	    border-radius: 4px;
	    color: var(--primary-color);
	    cursor: pointer;
	}
	.drop option{
		background-color: white !important;
	}
	.drop option:hover{
		cursor: pointer;
		background-color:var(--secondary-color);
	}
	.searchbox{
		width: 20%;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.search{
		position: relative;
    	display: inline-block;
	}
	.search input{
		border-radius: 10px;
		padding-left: 10px;
		border: 1px solid var(--primary-color);
	}
	.search i{
		position: absolute;
		right: 10px;
		top: 50%;
		transform: translateY(-50%);
		font-size: 18px;
		pointer-events: none;
		color: var(--accent-color);
	}
	.editbtn{
		color: white;
		background-color: var(--accent-color);
		border-radius: 10px;
		width: 70px;
	}
	.fa-trash-alt:hover{
		color: var(--accent-color);
		cursor: pointer;
	}
	table{
		width: -webkit-fill-available;
		border: 1px solid var(--primary-color);
		border-radius: 10px;
		margin-left: 48px;
		margin-right: 48px;
	}
	tr{
		border-bottom: 1px solid var(--primary-color);
		height: 40px;
	}
	th, td{
		padding-left: 15px;
	}
  </style>
</head>
<body class="bg-theme bg-theme1">
 <jsp:include page="header.jsp"></jsp:include>
 	<div class="dashboard-body">
		<div class="maintext">
			<h3 class="mail">메일함</h3>
			<h3>>&nbsp;&nbsp;받은 메일함</h3>
		</div>
		<div class="mailbox">
			<div class="mailnav">
				<div class="opt">
					<div>받은 메일함</div>
					<div>보낸 메일함</div>
					<div>임시저장</div>
					<div>휴지통</div>
					<select class="drop">
					  <option value="subject">전체메일</option>
					  <option value="content">중요메일</option>
					  <option value="subject">읽은메일</option>
					  <option value="content">읽지않은메일</option>
					</select>
				</div>
				<div class="searchbox">
					<div class="search">
						<input type="text" name="">
						<i class="fas fa-search"></i>
					</div>
					<button class="editbtn"><i class="far fa-edit"></i>작성</button>
				</div>
			</div>
			<table>
				<thead>
					<tr>
						<th>보낸 사람</th>
						<th>제목</th>
						<th>내용</th>
						<th>수신 시간</th>
					</tr>
				</thead>
				<tbody>
					<!-- 읽지 않은 메일 -->
					<tr class="unread">
						<td>example1@example.com</td>
						<td>읽지 않은 메일 제목</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-07 10:30</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<!-- 읽은 메일 -->
					<tr>
						<td>example2@example.com</td>
						<td>읽은 메일 제목</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-06 18:45</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example2@example.com</td>
						<td>읽은 메일 제목</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-06 18:45</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example2@example.com</td>
						<td>읽은 메일 제목</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-06 18:45</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example2@example.com</td>
						<td>읽은 메일 제목</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-06 18:45</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기 이메일 내용 미리보기</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
					<tr>
						<td>example3@example.com</td>
						<td>광고 메일</td>
						<td>이메일 내용 미리보기...</td>
						<td>2024-12-05 14:20</td>
						<td><i class="fas fa-trash-alt"></i></td>
					</tr>
				</tbody>
			</table>
		</div>
 	</div>
</body>
</html>
