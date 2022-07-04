# AzA : 학생관리플랫폼
![image](https://user-images.githubusercontent.com/85826542/177026070-9ca11667-ca04-4ade-aa95-075a42c1e1be.png)

수업관리와 소통을 하나의 앱에서, **아자 학생관리시스템**
**아자**는 언택트 시대에 선생님, 학생, 학부모가 보다 효율적으로 학업을 관리할 수 있는 교육용 플랫폼으로, 학생 출결 관리, 일정 관리, 비대면 결제 및 메신저 서비스를 제공합니다.

## Contents

-   [ABOUT](#ABOUT)
-   [SAMPLE CODE](#SAMPLE-CODE)
	- 학생관리-출석
	- 학생관리-성적
	- 채팅

## ABOUT

* 개발 기간 : 2022.04.28~2022.06.30
	* 분석 설계 : 4주
	* 구현 : 4주
	* 자료 정리 : 1주
* 개발 팀원 : **조혜미(조장)** / 안경호 / 조미연 / 이용승 / 노민정
* 팀 내 맡은 역할 :   
		- 성적 : 
			학생 성적 등록 / 조회 / 수정 / 삭제
		- 채팅 :
			채팅 등록 / 조회 / 수정 / 삭제 
		- 알림 :
			알림 등록 / 조회 / 수정 / 삭제
		- 출결 :
			출석 등록 / 조회 / 수정 / 삭제
		- 전체 학생 목록 :
			수업 추가 / 조회 / 수정 / 삭제
			학생 승인 / 삭제
		- Common :
			기타 공통, error page 등
* 기술적 고려사항
	* 프로그래밍 언어 :
		Java, Servlet, JSP
	* 적용 Architecture :
		2Layer, MVC, Interface base, Controller, RestController
	* 적용 Framework : 
		Spring Boot, Mybatis, Bootstrap
	* 웹 표준 기술 :
		CSS3, HTML5, Javascript, JQuery, Ajax, Node.js, Lombok, Sock.js
	* DB관리 기술:
		Oracle DB, Mongo DB
	* 기술적 특이사항 <적용 Open API> :
		FullCalendar API, Naver Search API, NAVER CLOVA chatbot API, NAVER sens API, I'mport API, Chart.js, SweetAlert, DataTable.js, Matrial.js, Scripts.js
	
* 구현 영상 : https://drive.google.com/file/d/1gptKkNvCIh_jwRwpRKe7ffj2_0yuMhbI/view?usp=sharing
* 요약 PPT : 
https://drive.google.com/file/d/1Nqb813pXgP_7iNaknPhfCRpmO69CbUge/view?usp=sharing
* 프로젝트 분석설계서 :
https://drive.google.com/file/d/11Vca6Uh9ZjoLYHcvNb2NnpGv-_VJjWCl/view?usp=sharing

## SAMPLE CODE
* 학생관리 - 출석
* 학생관리 - 성적
* 채팅

### 학생관리 - 출석

1. 학생 출석 등록
![main_attendace](https://user-images.githubusercontent.com/85826542/177026047-e739b864-4c98-4d28-a9a2-3be7c92c85f8.gif)
* 현재 시간을 sysdate로 받아, 당일 진행하는 수업 목록을 HOME에서 출력
* 출석 등록을 원하는 수업을 클릭하면, 해당 수업을 듣는 학생 목록 출력
* 해당 학생의 출석 상태를 등록, 수정할 수 있음
* 출석 등록 시, 해당 학생의 부모님에게 알림 전송
* 조퇴, 도망으로 수정 시, 해당 학생의 부모님에게 알림 전송
* com.aza.service.students.impl.StudentsServiceImpl.addStudentsAttendance()
	![image](https://user-images.githubusercontent.com/85826542/177026292-dc7cfe59-6726-4194-a482-624194795301.png)

2. 자녀 출석 조회
![image](https://user-images.githubusercontent.com/85826542/177026978-64e6592a-f2c6-4f9a-8b85-62276132ef75.png)
* 자녀의 출석 현황을 월별로 조회
* 가장 첫 화면은 학부모의 첫번째 자녀의 첫번째 수업의 출석 현황이 출력 (자녀이름, 관련 수업명을 선택하지 않을 시) 
* com.aza.web.students.StudentsRestController.listStudentsAttendance()
	![image](https://user-images.githubusercontent.com/85826542/177027170-c26e036c-17a2-4fa9-8d86-2feb0af29486.png)
	
	
### 학생관리 - 성적
![main_attendace](https://user-images.githubusercontent.com/85826542/177027403-609b6782-ed3a-45d5-a48f-d13422840ab6.gif)
* 학생은 자신의 성적을 등록, 조회, 수정, 삭제 가능
* 학부모는 자녀의 성적을 조회 가능
* 성적 입력시 유효성 검사를 통해 에러 방지
	

