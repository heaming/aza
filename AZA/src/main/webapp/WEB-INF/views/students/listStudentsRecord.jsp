<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Aza : main</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
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
<script type="text/javascript">

function deleteAlert(alertCode) {
	$.ajax({
		url:"http://localhost:8080/alert/rest/deleteAlert/"+alertCode,
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("deleteAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(!alertReadAt) {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">����</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger" onclick="return deleteAlert(`+alertCode+`)">delete</span>
						<p class="text-danger">����</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}              		
            	})
            	
            	$('.alertLi').remove();
	        	$("#alertDropDown").html("");
	        	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">�˸�</h6></li>
						<li><hr class="dropdown-divider my-0" /></li>`);
	        	$("#alertDropDown").append(listAlertView);
	        	$("#alertDropDown").addClass("show").attr("data-bs-popper", "static");

            } else {
            	console.log("faile");
            }
       }
	})
	
	
	
	
}



function listAlert() {
	$.ajax({
		url:"http://localhost:8080/alert/rest/listAlert",
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("listAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(!alertReadAt) {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">����</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger" onclick="return deleteAlert(`+alertCode+`)">delete</span>
						<p class="text-danger">����</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}              		
            	})
            	
            	$('.alertLi').remove();
            	$("#alertDropDown").html("");
            	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">�˸�</h6></li>
    					<li><hr class="dropdown-divider my-0" /></li>`);
            	$("#alertDropDown").append(listAlertView);

            } else {
            	console.log("faile");
            }
       }
	})
	
}

function readAlert(alertCode) {
	$.ajax({
		url:"http://localhost:8080/alert/rest/readAlert/"+alertCode,
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("readAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(alertReadAt == "") {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">����</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger">delete</span>
						<p class="text-danger">����</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}
            		
            		
            		
            	})
            	
            	$('.alertLi').remove();
            	$("#alertDropDown").html("");
            	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">�˸�</h6></li>
    					<li><hr class="dropdown-divider my-0" /></li>`);
            	$("#alertDropDown").append(listAlertView);
            	$("#alertDropDown").addClass("show").attr("data-bs-popper", "static");
            	
            } else {
            	console.log("faile");
            }
       }
	})
}



$(function() {

	// Alert
	 $('#dropdownMenuNotifications').on('click', function() {
		console.log("�˸� ��ư ����");
		listAlert();

	})
	
	
	
	// Message
	$("#open-messagePopup").on("click", function() {
		console.log("�޽��� ��ư ����");
		
        $.ajax({
            url: "http://localhost:8080/message/rest/listMessage",
            type: "GET",
            headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json",                                    
                },
            success: function(result) {
                if(result) {
                	console.log(result);
                	
                	sessionStorage.setItem('userId', result[0].userId);
                	
                	result.shift();
                	
                	console.log(result);
                	
                	var listOtherView = "";
                	
                	result.map((other,i) => {
               			
                		let studentId = other.studentId ? other.studentId : other.firstStudentId;
                		let studentName = other.studentId ? other.studentName : "�л��̷�";
                		let relationName = other.relationName ? other.relationName : "";
                		let userId = other.userId ? other.userId : studentId;
                		let userName = studentName + " " + relationName;
                		//console.log(i, studentId);
                		
                		listOtherView += `<ul id='getOtherMessage' class='list-unstyled mb-0' onclick="getOtherMessage('`+userId+`','`+userName+`')">
                		<li class='p-2 border-bottom' data-id=`+userId+`>
                            	<a class="d-flex justify-content-between">
                                    <div class="d-flex flex-row">
                                        <div class="pt-1">
                                            <p class="fw-bold mb-0">`+studentName+" "+relationName+`</p>
                                            <p class="small text-muted">�ֱٸ޽���</p>
                                        </div>
                                    </div>
                            	</a>
                        	</li>
                    	</ul>`;
                	});
                	
                	$('#getOtherMessage').remove();
                	$('#listOther').append(listOtherView);

                } else {
                    console.log("����");
                }
            } 
        })
		
	})

})
	





</script>



</head>

<body class="nav-fixed bg-light">
<div class="nav-fixed bg-light">
	<!-- Top app bar navigation menu-->
	<nav class="top-app-bar navbar navbar-expand navbar-dark bg-dark">
		<div class="container-fluid px-4">
			<!-- Drawer toggle button-->
			<button class="btn btn-lg btn-icon order-1 order-lg-0"
				id="drawerToggle" href="javascript:void(0);">
				<i class="material-icons">menu</i>
			</button>
			<!-- Navbar brand-->
			<a class="navbar-brand me-auto" href="index.html">
			<div class="text-uppercase">AZA : �л��������α׷�</div></a>
			<!-- Navbar items-->
			<div class="d-flex align-items-center mx-3 me-lg-0">
				<!-- Navbar-->
				<ul class="navbar-nav d-none d-lg-flex">
					<li class="nav-item"><a class="nav-link" href="#">Overview</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://docs.startbootstrap.com/material-admin-pro"
						target="_blank">Documentation</a></li>
				</ul>
				<!-- Navbar buttons-->
				<div class="d-flex">
					<!-- Messages dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuMessages" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons">mail_outline</i>
						</button>
					</div>
			
<!-- 						<ul
							class="dropdown-menu dropdown-menu-end me-3 mt-3 py-0 overflow-hidden"
							aria-labelledby="dropdownMenuMessages">
							<li><h6
									class="dropdown-header bg-primary text-white fw-500 py-3">Messages</h6></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item unread" href="#!">
									<div class="dropdown-item-content">
										<div class="dropdown-item-content-text">
											<div class="text-truncate d-inline-block"
												style="max-width: 18rem">Hi there, I had a question
												about something, is there any way you can help me out?</div>
										</div>
										<div class="dropdown-item-content-subtext">Mar 12, 2021
											&middot; Juan Babin</div>
									</div>
							</a></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item" href="#!">
									<div class="dropdown-item-content">
										<div class="dropdown-item-content-text">
											<div class="text-truncate d-inline-block"
												style="max-width: 18rem">Thanks for the assistance the
												other day, I wanted to follow up with you just to make sure
												everyting is settled.</div>
										</div>
										<div class="dropdown-item-content-subtext">Mar 10, 2021
											&middot; Christine Hendersen</div>
									</div>
							</a></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item" href="#!">
									<div class="dropdown-item-content">
										<div class="dropdown-item-content-text">
											<div class="text-truncate d-inline-block"
												style="max-width: 18rem">Welcome to our group! It's
												good to see new members and I know you will do great!</div>
										</div>
										<div class="dropdown-item-content-subtext">Mar 8, 2021
											&middot; Celia J. Knight</div>
									</div>
							</a></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item py-3" href="#!">
									<div class="d-flex align-items-center w-100 justify-content-end text-primary">
										<div class="fst-button small">View all</div>
										<i class="material-icons icon-sm ms-1">chevron_right</i>
									</div>
							</a></li>
						</ul>
					</div> -->
					
					
					
					
					<!-- Notifications and alerts dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuNotifications" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="material-icons">notifications</i>
						</button>
						<ul id="alertDropDown"
							class="dropdown-menu dropdown-menu-end me-3 mt-3 py-0 overflow-hidden"
							aria-labelledby="dropdownMenuNotifications">
						</ul>
					</div>
					
					
					<!-- User profile dropdown-->
					<div class="dropdown">
						<button class="btn btn-lg btn-icon dropdown-toggle"
							id="dropdownMenuProfile" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons">person</i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end mt-3"
							aria-labelledby="dropdownMenuProfile">
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">person</i>
									<div class="me-3">Profile</div>
							</a></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">settings</i>
									<div class="me-3">Settings</div>
							</a></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">help</i>
									<div class="me-3">Help</div>
							</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">logout</i>
									<div class="me-3">Logout</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Layout wrapper-->
	<div id="layoutDrawer">
		<!-- Layout navigation-->
		<div id="layoutDrawer_nav">
			<!-- Drawer navigation-->
			<nav class="drawer accordion drawer-light bg-white"
				id="drawerAccordion">
				<div class="drawer-menu">
					<div class="nav">
						<!-- Drawer section heading (Account)-->
						<div class="drawer-menu-heading d-sm-none">Account</div>
						<!-- Drawer link (Notifications)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons">notifications</i>
							</div> Notifications
						</a>
						<!-- Drawer link (Messages)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons">mail</i>
							</div> Messages
						</a>
						<!-- Divider-->
						<div class="drawer-menu-divider d-sm-none"></div>
						<!-- Drawer section heading (Interface)-->
						<div class="drawer-menu-heading">Interface</div>
						<!-- Drawer link (Overview)-->
						<a class="nav-link" href="index.html">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> Overview
						</a>
						<!-- Drawer link (Dashboards)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseDashboards"
							aria-expanded="false" aria-controls="collapseDashboards">
							<div class="nav-link-icon">
								<i class="material-icons">dashboard</i>
							</div> Dashboards
							<div class="drawer-collapse-arrow">
								<i class="material-icons">expand_more</i>
							</div>
						</a>
						<!-- Nested drawer nav (Dashboards)-->
						<div class="collapse" id="collapseDashboards"
							aria-labelledby="headingOne" data-bs-parent="#drawerAccordion">
							<nav class="drawer-menu-nested nav">
								<a class="nav-link" href="app-dashboard-default.html">Default</a>
								<a class="nav-link" href="app-dashboard-minimal.html">Minimal</a>
								<a class="nav-link" href="app-dashboard-analytics.html">Analytics</a>
								<a class="nav-link" href="app-dashboard-accounting.html">Accounting</a>
								<a class="nav-link" href="app-dashboard-orders.html">Orders</a>
								<a class="nav-link" href="app-dashboard-projects.html">Projects</a>
							</nav>
						</div>
						<!-- Drawer link (Layouts)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
							aria-expanded="false" aria-controls="collapseLayouts">
							<div class="nav-link-icon">
								<i class="material-icons">view_compact</i>
							</div> Layouts
							<div class="drawer-collapse-arrow">
								<i class="material-icons">expand_more</i>
							</div>
						</a>
						<!-- Nested drawer nav (Layouts)-->
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#drawerAccordion">
							<nav class="drawer-menu-nested nav">
								<a class="nav-link" href="layout-dark.html">Dark Theme</a> <a
									class="nav-link" href="layout-light.html">Light Theme</a> <a
									class="nav-link" href="layout-static.html">Static
									Navigation</a>
							</nav>
						</div>
						<!-- Drawer link (Pages)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapsePages"
							aria-expanded="false" aria-controls="collapsePages">
							<div class="nav-link-icon">
								<i class="material-icons">layers</i>
							</div> Pages
							<div class="drawer-collapse-arrow">
								<i class="material-icons">expand_more</i>
							</div>
						</a>
						<!-- Nested drawer nav (Pages)-->
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#drawerAccordion">
							<nav class="drawer-menu-nested nav accordion"
								id="drawerAccordionPages">
								<!-- Drawer link (Pages -> Account)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAccount" aria-expanded="false"
									aria-controls="pagesCollapseAccount"> Account
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Account)-->
								<div class="collapse" id="pagesCollapseAccount"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="app-account-billing.html">Billing</a>
										<a class="nav-link" href="app-account-notifications.html">Notifications</a>
										<a class="nav-link" href="app-account-profile.html">Profile</a>
										<a class="nav-link" href="app-account-security.html">Security</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Authentication)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth"
									aria-expanded="false" aria-controls="pagesCollapseAuth">
									Authentication
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Authentication)-->
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="app-auth-login-basic.html">Login
											1</a> <a class="nav-link" href="app-auth-login-styled-1.html">Login
											2</a> <a class="nav-link" href="app-auth-login-styled-2.html">Login
											3</a> <a class="nav-link" href="app-auth-register-basic.html">Register</a>
										<a class="nav-link" href="app-auth-password-basic.html">Forgot
											Password</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Blank Pages)-->
								<a class="nav-link" href="app-blank-page.html">Blank Page</a>
								<!-- Drawer link (Pages -> Error)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse" data-bs-target="#pagesCollapseError"
									aria-expanded="false" aria-controls="pagesCollapseError">
									Error
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Error)-->
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="app-error-400.html">400 Error
											Page</a> <a class="nav-link" href="app-error-401.html">401
											Error Page</a> <a class="nav-link" href="app-error-403.html">403
											Error Page</a> <a class="nav-link" href="app-error-404.html">404
											Error Page</a> <a class="nav-link" href="app-error-429.html">429
											Error Page</a> <a class="nav-link" href="app-error-500.html">500
											Error Page</a> <a class="nav-link" href="app-error-503.html">503
											Error Page</a> <a class="nav-link" href="app-error-504.html">504
											Error Page</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Pricing)-->
								<a class="nav-link" href="app-invoice.html">Invoice</a>
								<!-- Drawer link (Pages -> Knowledgebase)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseKnowledgebase"
									aria-expanded="false"
									aria-controls="pagesCollapseKnowledgebase"> Knowledgebase
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Knowledgebase)-->
								<div class="collapse" id="pagesCollapseKnowledgebase"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="#">Home</a>
										<a class="nav-link" href="#">Categories</a>
										<a class="nav-link" href="#">Article</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Pricing)-->
								<a class="nav-link" href="#">Pricing</a>
							</nav>
						</div>
						<!-- Divider-->
						<div class="drawer-menu-divider"></div>
				<!-- Drawer footer        -->
				<div class="drawer-footer border-top">
					<div class="d-flex justify-content-center">
						<form class="d-flex align-items-center">
							<button type="submit" class="btn btn-text-secondary btn-icon btn-lg me-3"><i class="material-icons text-secondary">add_circle_outline</i></button>
							<div class="">
							    <label for="inputLessonCod" class="form-label text-secondary">���� �߰�</label>
							    <input type="text" class="form-control pl-2" id="inputLessonCode" placeholder="�����ڵ带 �Է��ϼ���:D"/>
							</div>
						</form>					
						
					</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
</div>
	<!-- Layout content-->
	 <!-- Layout content-->
            <div id="layoutDrawer_content">
                <!-- Main page content-->
                <main>
                <header class="mb-9">
                        <div class="container-xl p-5 mb-3">
                             <!-- <div class="row align-items-center justify-content-between">
                                <div class="col-12 col-md mb-4 mb-md-0">
                                    <h1 class="mb-1 display-4 fw-500 text-white">�л� ���</h1>
                                    <p class="lead mb-0 text-white">STUDENTS LIST</p>
                                </div>
                                <div class="col-12 col-md-auto flex-shrink-0">
                                    <label class="form-label text-white-50" for="litepickerDateRange">Date range:</label>
                                    <input class="form-control mb-0" id="litepickerDateRange" placeholder="Select date range..." value="Mar 8, 2021 - Mar 14, 2021" style="min-width: 13rem; height: 3rem">
                                <div class="litepicker-backdrop"></div></div>
                            </div> -->
                        </div> 
                    </header>
                    <div class="container-xl px-5">
                        <div class="card card-raised mb-5">
                            <div class="card-header bg-transparent px-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="me-4">
                                        <h2 class="display-6 mb-0">�л� ���</h2>
                                        <div class="card-text">Students List</div>
                                    </div>
<!--                                     <div class="d-flex gap-2">
                                        <button class="btn btn-lg btn-text-primary btn-icon mdc-ripple-upgraded" type="button"><i class="material-icons">download</i></button>
                                        <button class="btn btn-lg btn-text-primary btn-icon mdc-ripple-upgraded" type="button"><i class="material-icons">print</i></button>
                                    </div> -->
                                </div>
                            </div>
                            <div class="card-body p-4">


                        <!-- Simple DataTables example-->
                        <table id="datatablesSimple">
                        
                        </table>
                      </div>
                                
                        </div>
                        <hr class="my-5" />
                    </div>
                </main>
	<!-- Footer-->
	<footer>
		<button type="button" id="open-messagePopup" class="btn float btn-lg btn-icon"><i class="material-icons">mail_outline</i></button>
		<%-- <jsp:include page="/WEB-INF/views/common/home.jsp" /> --%>
	</footer>
	</div>
	  <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="/resources/javascript/common/charts/chart-defaults.js"></script> -->
	<script src="/resources/javascript/common/prism.js"></script>
	<script src="/resources/javascript/common/material.js"></script>
	<script src="/resources/javascript/common/scripts.js"></script>
	<script src="/resources/javascript/common/datatables/datatables-simple-demo.js"></script>
<!-- 	<script src="/resources/javascript/common/charts/demos/dashboard-chart-area-light-demo.js"></script> -->
	<script type="text/javascript">
</script>
</body>
</html>