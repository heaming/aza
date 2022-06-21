<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="euc-kr">
	<title>���ǳ�Ʈ</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- ���̹� ����Ʈ������  -->
	<!-- <head> �ȿ� �߰� -->
	<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="euc-kr"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<!-- 2.10.0 ������ js ���� �Ϻκ��� ���� ���� �߻� ! -->
	
	<!-- head �ȿ� �߰� -->
	
	<!-- //////////////////////////////////////////////////// -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/webjars/stomp-websocket/stomp.min.js"></script>
	<script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script>
<!-- 	<script defer src="/resources/javascript/message/asserts/ui.js"></script> -->
	<script defer src="/resources/javascript/alert/alertUI.js"></script>
	<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
	<!-- Load Favicon-->
	<link href="assets/img/favicon.ico" rel="shortcut icon"
		type="image/x-icon">
	<!-- Load Material Icons from Google Fonts-->
	<link
		href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
		rel="stylesheet">
	<!-- Load Simple DataTables Stylesheet-->
	
	<!-- Roboto and Roboto Mono fonts from Google Fonts-->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
		rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet">
	<!-- Load main stylesheet-->
	
	
	
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
	
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.css"/>
	 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.js"></script>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
		rel="stylesheet">
	<style>
	*, body { 
	font-family: Pretendard, 'Noto Sans KR';
	}
	</style>
	<link href="/resources/css/styles.css" rel="stylesheet">
	<link href="/resources/css/common.css" rel="stylesheet">
	
	
	<!-- //////////////////////////////////////////////////// -->
	<script>			
	
/* 	function save(){
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	    		//����Ʈ ������ ���� �ؽ�Ʈ�������� ����
		var content = document.getElementById("smartEditor").value;
		alert(document.getElementById("txtContent").value); 
	    		// ���� �ҷ��� �� document.get���� �޾ƿ���
		return; 
	} */

    function updateBtn() {
		  oEditors.getById["noteContent"].exec("UPDATE_CONTENTS_FIELD", [])
		  //����Ʈ ������ ���� �ؽ�Ʈ�������� ����
		  let noteContent = document.getElementById("noteContent").value
		  let noteTitle = document.getElementById("noteTitle").value
		  let noteCode = document.getElementById("noteCode").value
		  // ���� �ҷ��� �� document.get���� �޾ƿ���
		  if(noteContent == '' || noteTitle == '') {
		    alert("����� ������ �Է����ּ���.")
		    oEditors.getById["noteContent"].exec("FOCUS")
		    return
		  } else {
			/* alert(document.getElementById("noteContent").value) */
		    console.log(noteContent)
/* 		    document.noteForm.action='students/updateStudentsNote';
		    document.noteForm.submit(); */
		    $("form").attr("method" , "POST").attr("action" , "/students/updateStudentsNote").submit();
		  }
		  
		  
	}
	
	function deleteBtn() {
		if(window.confirm("���� �����Ͻðڽ��ϱ�?")){
			if(true){
				$("form").attr("method", "POST").attr("action","/students/deleteStudentsNote").submit();
			}else{
				alert('������ ��ҵǾ����ϴ�.');
			}
		}	
	}
	
	$(function() {
		
		$( "button.btn.btn-outline-primary:contains('�ڷ�')").on("click" , function() {
			history.go(-1);
		});
	});	
	
	</script>
	
	
	

</head>
<body>

<%-- <form name="noteForm" action="updateStudentsNote" method="post">
	      <div id="smarteditor">
	      	<input name="noteTitle" id="noteTitle" value="${students.noteTitle}" style="width: 100%" placeholder="������ �Է����ּ���"></input>
	      	<input name="studentId" id="studentId" value="${students.studentId}" placeholder="�л� �̸�"></input>
	        <textarea name="noteContent" id="noteContent" value="${students.noteContent}"
	                  rows="30" cols="10" 
	                  placeholder="������ �Է����ּ���"
	                  style="width: 100%"></textarea>

	      </div>
      <input type="button" onclick="updateBtn();" value="Ȯ��"/>
      <button id="cancelUpdateBtn" type="button" class="btn btn-primary">���</button>

    </form> --%>
    
    
    <form>
    <div class="border border-top-0 p-3 p-sm-5 bg-light" >
	<div class="col flex-shrink-0 mb-5 mb-md-0" style="margin: 20px 20px 20px 20px">
	        <h1 class="display-4 mb-0">�� �� �� Ʈ</h1>
	        <div class="text-muted">Students Note</div>
   	</div>
    	<div id="smarteditor" style="margin: 0px 30px 30px 30px">
	    	<div class="input-group mb-3">
		            <button class="btn btn-outline-primary" type="button" style="width:120px;">�� ��</button>
		            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
		             name="noteTitle" id="noteTitle" value="${students.noteTitle}" aria-describedby="button-addon1">
	        </div>
	        <input type="hidden" class="form-control" type="text" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
	                	name="studentId" id="studentId" value="${students.studentId}"></input>
	      	<input type="hidden" name="noteCode" id="noteCode" value="${students.noteCode }"/>
	        <textarea name="noteContent" id="noteContent" value="${students.noteContent}"
			           rows="30" cols="10" 
			           style="width: 100%">${students.noteContent}</textarea>
        </div>
        <div align="center">
              <input type="button" onclick="updateBtn();" class="btn btn-outline-primary" value="����"/>
              <input type="button" onclick="deleteBtn();" class="btn btn-outline-primary" value="����"/>
              <button id="backBtn" type="button" class="btn btn-outline-primary">�ڷ�</button>
		</div>
	</div>
    </form>
    
    <script>
	    let oEditors = []
	
	    smartEditor = function() {
	      console.log("Naver SmartEditor")
	      nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "noteContent",	//textarea ID �Է�
	        sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",	//smartEditor2Skin.html ��� �Է�
	        fCreator: "createSEditor2"
	      
	      })
	    }
		
	    $(document).ready(function() {
	      smartEditor()
	    })
	    	    

	 </script>
	
	
	<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="/resources/javascript/common/charts/chart-defaults.js"></script> -->
	<script src="/resources/javascript/common/prism.js"></script>
	<script src="/resources/javascript/common/material.js"></script>
	<script src="/resources/javascript/common/scripts.js"></script>
	<script src="/resources/javascript/common/datatables/datatables-simple-demo2.js"></script>
<!-- 	<script src="/resources/javascript/common/charts/demos/dashboard-chart-area-light-demo.js"></script> -->

</body>
</html>