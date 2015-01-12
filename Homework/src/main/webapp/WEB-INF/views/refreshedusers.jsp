
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
				<td><a
					onclick="showUpdateModal('${user.id}')" data-toggle="modal"
					class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a> <a
					onclick="showDeleteModal('${user.id}')" id="#deleteModalButton"
					data-toggle="modal" class="btn btn-danger btn-xs"><i
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

<script type="text/javascript">
		
		$('#dynamic-table').dataTable();
</script>