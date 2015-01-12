
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty error }">
	${error }
</c:if>

<form role="form" id="userEditForm" >
	<div class="form-group">
		<label for="exampleInputEmail1">Kullanıcı Adı</label> <input
			type="text" class="form-control" value="${user.username }" id="usernameEdit" name="usernameEdit"
			required placeholder="">
	</div>

	<div class="form-group">
		<label for="exampleInputEmail1">Adı</label> <input type="text"
			class="form-control" value="${user.firstName }" id="firstNameEdit" name="firstNameEdit" required
			placeholder="">
	</div>

	<div class="form-group">
		<label for="exampleInputEmail1">Soyadı</label> <input type="text"
			class="form-control" value="${user.lastName }" id="lastNameEdit" name="lastNameEdit" required
			placeholder="">
	</div>

	<div class="form-group">
		<label for="exampleInputEmail1">Telefon</label> <input type="text"
			class="form-control" value="${user.phone }" id="phone-numberEdit"  name="phone-numberEdit" required
			maxlength="14" placeholder="(XXX) XXX-XXXX">
	</div>

	<input type="hidden" name="uid" id="uid" value="${user.id }" />
	<button type="submit" class="btn btn-success">Güncelle</button>

	<button type="submit" data-dismiss="modal" class="btn btn-default">İptal
	</button>
</form>


<script type="text/javascript">
	
$("#userEditForm").submit(function() {

    var url 	   = "updateuser.html";
    var urlAfter   = "refreshusers.html";
    var uId 	   = $("#uid").val(); 
    
	$('#editModal .dvLoading').fadeIn(200);
    $.ajax({
    	   async:false,
           type: "POST",
           url: url,
           data: $("#userEditForm").serialize(),
           success: function(data)
           {	
              $('#updateResult').html(data);
              $('#editModal .dvLoading').html("<br/><br/><br/>Güncellendi...");
        	  $('#editModal .dvLoading').fadeOut(1000);
        	  $('#editModal').find('input:text').val('');   
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
    
    $('#editModal .dvLoading').html("<br/><br/><br/>Yükleniyor...");
    showUpdateModal(uId);

    
    return false; 
});


$('#phone-numberEdit')

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





</script>