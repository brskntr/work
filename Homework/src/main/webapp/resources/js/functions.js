/**
 * 
 */

 var currentId;
 
 function showDeleteModal(id){
	  currentId = id;
	  $('#deleteModal').modal('show');
	  $('#deleteResult').html("Seçmiş olduğunuz kullanıcıyı silmek istediğinize EMİN MİSİNİZ?");
      $('#deleteResultFooter').html('<button data-dismiss="modal" class="btn btn-default" type="button" >Vazgeç</button>'
    		   +'<button  class="btn btn-danger" type="button" onclick="deleteUser()" >SİL</button>');
 }
 
 function showNewModal(){
	 $('#insertResult').html("");
	 $('#yeniModal').find('input:text').val('');
	 $('#yeniModal').modal('show');
 }
 
 function showUpdateModal(uId){
	 $('#updateResult').html("");
	 
	 var url = "updateform.html";
	 $('#editModal .dvLoading').fadeIn(1500);
	 $('#editModal').modal('show');

	    $.ajax({
	           type: "POST",
	           url: url,
	           data: {id:uId},
	           success: function(result)
	           {
	        	  $('#editModalBody').html(result);
	        	  $('#editModal .dvLoading').fadeOut(1000);
	           }
	         });
	    
	
 }
 
 function deleteUser(){
	 
	 id = currentId;
	 var url = "deleteuser.html";
	 var urlAfter = "refreshusers.html";
	 
	 $('#deleteModal .dvLoading').fadeIn(1500);
	    $.ajax({
	    	   async:false,
	           type: "POST",
	           url: url,
	           data: {id:id},
	           success: function(data)
	           {
	              $('#deleteResult').html(data);
	              $('#deleteResultFooter').html("");
	              $('#deleteModal .dvLoading').html("<br/><br/><br/>Silindi");
	        	  $('#deleteModal .dvLoading').fadeOut(1000);
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
 