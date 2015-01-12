<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.png">

<title></title>


<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-reset.css" rel="stylesheet">
<link href="resources/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<link rel="resources/stylesheet" href="css/owl.carousel.css"
	type="text/css">
<link href="resources/css/slidebars.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet" />
<link href="resources/assets/advanced-datatable/media/css/demo_page.css"
	rel="stylesheet" />
<link
	href="resources/assets/advanced-datatable/media/css/demo_table.css"
	rel="stylesheet" />
<link rel="resources/stylesheet"
	href="assets/data-tables/DT_bootstrap.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/bootstrap-datetimepicker/css/datetimepicker.css" />
<link rel="resources/stylesheet" type="text/css"
	href="assets/jquery-multi-select/css/multi-select.css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
      <script src="resources/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>

	<section id="container">
		<!--header start-->
		<header class="header white-bg">
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right"
					data-original-title="Toggle Navigation"></div>
			</div>



		</header>
		<!--header end-->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu" id="nav-accordion">
					<li><a href="index.html"> <i class="fa fa-home"></i> <span>Ana
								Sayfa</span>
					</a></li>

					<li><a class="active" href="index.html"> <i
							class="fa fa-user"></i> <span>Kullanıcılar</span>
					</a></li>


				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">

				<!-- page start-->
				<div class="row">
					<div class="col-sm-12">
						<section class="panel">
							<header class="panel-heading">
								Kullanıcılar <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<div class="adv-table">

									<div class="clearfix">
										<div class="btn-group">
											<a onclick="showNewModal()" data-toggle="modal"
												class="btn btn-success"><i class="fa fa-plus"></i> Yeni
											</a>
										</div>
									</div>
									<div id="usersTable">
									<table class="display table table-bordered table-striped"
										id="dynamic-table">
										<thead>
											<tr>
												<th>Kullanıcı Adı</th>
												<th>Adı</th>
												<th>Soyadı</th>
												<th>Telefon</th>
												<th></th>

											</tr>
										</thead>
										<tbody>

											<c:forEach var="user" items="${users }">
												<tr class="gradeA">
													<td>${user.username }</td>
													<td>${user.firstName }</td>
													<td>${user.lastName }</td>
													<td>${user.phone }</td>
													<td>
														<a onclick="showUpdateModal('${user.id}')" data-toggle="modal"
														class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
														<a onclick="showDeleteModal('${user.id}')" id="#deleteModalButton" data-toggle="modal"
														class="btn btn-danger btn-xs"><i
															class="fa fa-trash-o "></i></a></td>
												</tr>
			 							  </c:forEach>


										</tbody>
										<tfoot>
											<tr>
												<th>Kullanıcı Adı</th>
												<th>Adı</th>
												<th>Soyadı</th>
												<th>Telefon</th>
												<th></th>
											</tr>
										</tfoot>
									</table>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>



			</section>

			<section>

				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
					tabindex="-1" id="yeniModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 class="modal-title">Yeni Kullanıcı</h4>
								<div class="dvLoading"> <br/><br/><br/><br/>Kaydediliyor...</div>
							</div>
							<div class="modal-body">

								<form role="form" id="userForm" >
									<div class="form-group">
										<label for="exampleInputEmail1">Kullanıcı Adı</label>
										 <input type="text" class="form-control" id="username"
											name="username" required placeholder="">
									</div>
									
									<div class="form-group">
										<label for="exampleInputEmail1">Adı</label>
										 <input type="text" class="form-control" id="firstName"
											name="firstName" required  placeholder="">
									</div>
									
									<div class="form-group">
										<label for="exampleInputEmail1">Soyadı</label>
										 <input type="text" class="form-control" id="lastName"
											name="lastName" required placeholder="">
									</div>
									
									<div class="form-group">
										<label for="exampleInputEmail1">Telefon</label>
										 <input type="text" class="form-control" id="phone-number" name="phone-number" 
										 required  maxlength="14" placeholder="(XXX) XXX-XXXX" >
									</div>
									
									<div class="form-group" id="codeArea" >
										<img src="getimage.html"   width="150" height="40" />
									</div>
									
									
									<div class="form-group">
									<div style="width:30%"  >
										<label for="exampleInputEmail1">Doğrulama Kodu</label>
										 <input type="text" class="form-control" id="code"
											name="code" required  placeholder="">
									</div>
									</div>

									<button type="submit" class="btn btn-success">Kaydet</button>
									
									<button type="submit" data-dismiss="modal" class="btn btn-default">İptal </button>
								</form>
							</div>
							
							<div class="modal-footer" id="insertResult" style="text-align:left;min-height:70px;padding-top:20px;" >
								
								
							
							</div>
						</div>
					</div>
				</div>

				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
					tabindex="-1" id="editModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 class="modal-title">Düzenle</h4>
								<div class="dvLoading"> <br/><br/><br/><br/>Yükleniyor...</div>
							</div>
							<div class="modal-body" id="editModalBody">
									
								
							</div>
							<div class="modal-footer" id="updateResult" style="text-align:left;min-height:70px;padding-top:20px;" >
								
								
							
							</div>
						</div>
					</div>
				</div>

				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
					tabindex="-1" id="detayModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 class="modal-title">Detaylar</h4>
							</div>
							<div class="modal-body">

								
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title">Silme Onayı</h4>
								<div class="dvLoading"> <br/><br/><br/><br/>Siliniyor...</div>
							</div>
							<div class="modal-body" id="deleteResult" style="text-align:left;" >Seçmiş olduğunuz kullanıcıyı silmek
								istediğinize EMİN MİSİNİZ?</div>
							<div class="modal-footer"  id="deleteResultFooter" style="text-align:left;min-height:70px" >
								
							</div>
						</div>
					</div>
				</div>

			</section>
		</section>
		<!--main content end-->


		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				2014 &copy; Infonal. <a href="#" class="go-top"> <i
					class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="resources/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="resources/js/jquery.scrollTo.min.js"></script>
	<script src="resources/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="resources/js/jquery.sparkline.js" type="text/javascript"></script>
	<script
		src="resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
	<script src="resources/js/owl.carousel.js"></script>
	<script src="resources/js/jquery.customSelect.min.js"></script>
	<script src="resources/js/respond.min.js"></script>
	<script src="resources/js/slidebars.min.js"></script>
	<script src="resources/js/common-scripts.js"></script>
	<script src="resources/js/sparkline-chart.js"></script>
	<script src="resources/js/easy-pie-chart.js"></script>
	<script src="resources/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="resources/js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" language="javascript"
		src="resources/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="resources/assets/data-tables/DT_bootstrap.js"></script>
	<script src="resources/js/dynamic_table_init.js"></script>
	<script src="resources/js/bootstrap-switch.js"></script>
	<script src="resources/js/jquery.tagsinput.js"></script>
	<script type="text/javascript" src="resources/js/ga.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="resources/assets/ckeditor/ckeditor.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script src="js/form-component.js"></script>
	<script type="text/javascript"
		src="resources/assets/fuelux/js/spinner.min.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="resources/assets/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript"
		src="resources/assets/jquery-multi-select/js/jquery.quicksearch.js"></script>
	<script src="resources/js/advanced-form-components.js"></script>
	<script src="resources/js/functions.js"></script>
	<script src="https://raw.githubusercontent.com/digitalBush/jquery.maskedinput/1.4.0/dist/jquery.maskedinput.js" type="text/javascript"></script>
    
	<script>
		//owl carousel

		$(document).ready(function() {
			$("#owl-demo").owlCarousel({
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true,
				autoPlay : true

			});
			
			
			$("#userForm").submit(function() {

			    var url 	   = "saveuser.html";
			    var urlAfter   = "refreshusers.html";
			    var urlCodeRef = "refreshcode.html";
			    var errorType;
			    
				$('#yeniModal .dvLoading').fadeIn(200);
			    $.ajax({
			    	   async:false,
			           type: "POST",
			           url: url,
			           data: $("#userForm").serialize(),
			           success: function(data)
			           {	
			              $('#insertResult').html(data);
			              errorType = $('#errorType').val();
			              if(errorType!="codeError") {
			              $('#yeniModal .dvLoading').html("<br/><br/><br/>Kaydediliyor");
			        	  $('#yeniModal .dvLoading').fadeOut(1000);
			        	  $('#yeniModal').find('input:text').val('');
			              }
			              else {
			            	  $('#yeniModal .dvLoading').html("<br/><br/><br/>Kaydediliyor");
				        	  $('#yeniModal .dvLoading').fadeOut(1000);  
			              }
			           }
			         });
			   
			    if(errorType!="codeError") {
			    $.ajax({
			    	   async:false,
			           type: "GET",
			           url: urlCodeRef,
			           success: function(data)
			           {	
			              $('#codeArea').html('<img src="${pageContext.servletContext.contextPath}/refreshcode.html" />');
			           }
			         });
			    
			    $.ajax({
			    	   async:false,
			           type: "GET",
			           url: urlAfter,
			           success: function(data)
			           {	
			              $('#usersTable').html(data);
			           }
			         });
			    
			    }
			    
			    return false; 
			});
			
			
			
			$('#phone-number')

			.keydown(function (e) {
				var key = e.charCode || e.keyCode || 0;
				$phone = $(this);

				// Auto-format- do not expose the mask as the user begins to type
				if (key !== 8 && key !== 9) {
					if ($phone.val().length === 4) {
						$phone.val($phone.val() + ')');
					}
					if ($phone.val().length === 5) {
						$phone.val($phone.val() + ' ');
					}			
					if ($phone.val().length === 9) {
						$phone.val($phone.val() + '-');
					}
				}

				// Allow numeric (and tab, backspace, delete) keys only
				return (key == 8 || 
						key == 9 ||
						key == 46 ||
						(key >= 48 && key <= 57) ||
						(key >= 96 && key <= 105));	
			})
			
			.bind('focus click', function () {
				$phone = $(this);
				
				if ($phone.val().length === 0) {
					$phone.val('(');
				}
				else {
					var val = $phone.val();
					$phone.val('').val(val); // Ensure cursor remains at the end
				}
			})
			
			.blur(function () {
				$phone = $(this);
				
				if ($phone.val() === '(') {
					$phone.val('');
				}
			});
			
			
			
			
		});
		

		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});
	</script>

</body>
</html>



