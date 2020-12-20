<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		$('button[type=submit]').click(function(e) {
			e.preventDefault();
			//Disable submit button
			$(this).prop('disabled', true);

			var form = document.forms[0];
			var formData = new FormData(form);

			// Ajax call for file uploaling
			var ajaxReq = $.ajax({
				url : contextPath + "/uploadAjax.json",
				type : 'POST',
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				xhr : function() {
					//Get XmlHttpRequest object
					var xhr = $.ajaxSettings.xhr();

					//Set onprogress event handler 
					xhr.upload.onprogress = function(event) {
						var perc = Math.round((event.loaded / event.total) * 100);
						$('#progressBar').text(perc + '%');
						$('#progressBar').css('width', perc + '%');
					};
					return xhr;
				},
				beforeSend : function(xhr) {
					//Reset alert message and progress bar
					$('#alertMsg').text('');
					$('#progressBar').text('');
					$('#progressBar').css('width', '0%');
				}
			});

			// Called on success of file upload
			ajaxReq.done(function(msg) {
				$('#alertMsg').text(msg);
				$('input[type=file]').val('');
				$('button[type=submit]').prop('disabled', false);
			});

			// Called on failure of file upload
			ajaxReq.fail(function(jqXHR) {
				$('#alertMsg').text(jqXHR.responseText + '(' + jqXHR.status + ' - ' + jqXHR.statusText + ')');
				$('button[type=submit]').prop('disabled', false);
			});
		});
	});
</script>

<div class="container">
	<!-- File Upload From -->
	<form method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>Select File</label> <input class="form-control" type="file" name="files" multiple>
		</div>
		<div class="form-group">
			<button class="btn btn-primary" type="submit">Upload</button>
		</div>
	</form>
	<br />

	<!-- Bootstrap Progress bar -->
	<div class="progress">
		<div id="progressBar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
			style="width: 0%">0%</div>
	</div>

	<!-- Alert -->
	<div id="alertMsg" style="color: red; font-size: 18px;"></div>
</div>

