<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.drag-over {
	background-color: #ff0;
}

.thumb {
	width: 200px;
	padding: 5px;
	float: left;
}

.thumb>img {
	width: 100%;
	height: 100px;
}

.thumb>progress {
	width: 100%;
}

.thumb>.close {
	position: absolute;
	background-color: red;
	cursor: pointer;
}
</style>


<script>
	$(function() {

		var uploadFiles = [];
		var $drop = $("#drop");
		$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
			$(this).addClass('drag-over');
		}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {
			e.stopPropagation();
			e.preventDefault();
		}).on('drop', function(e) {
			e.preventDefault();
			$(this).removeClass('drag-over');
			var files = e.originalEvent.dataTransfer.files;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				console.log(file);
				var idx = uploadFiles.push(file);
				preview(file, idx - 1);
			}
		});

		/* function preview(file, idx) {
		    var reader = new FileReader();
		    reader.onload = (function(f, idx) {
		        return function(e) {
		        	
		        	 var html = "";
		             html += "<div class='thumb'>"
		             html += "    <progress value='0' max='100' ></progress>"
		             html += "    <div class='close' data-idx=" + idx + ">X</div>"
		             html += "    <img src=" + e.target.result + " title=" + escape(f.name) + "/>"
		             html += "</div>"
		             
		           	 var $div = $(html);
		            $("#thumbnails").append($div);
		            f.target = $div;
		        };
		    })(file, idx);
		    reader.readAsDataURL(file);
		} */

		function preview(file, idx) {
			var reader = new FileReader();
			var $div;
			if (file.type.match('image.*')) {
				reader.onload = (function(f, idx) {
					return function(e) {

						var html = "";
						html += "<div class='thumb'>"
						html += "    <progress value='0' max='100' ></progress>"
						html += "    <div class='close' data-idx=" + idx + ">X</div>"
						html += "    <img src=" + e.target.result + " title=" + f.name + "/>"
						html += "</div>"

						$div = $(html);
						$("#thumbnails").append($div);
						f.target = $div;
					};
				})(file, idx);
				reader.readAsDataURL(file);
			} else {

				var html = "";
				html += "<div class='thumb'>"
				html += "    <progress value='0' max='100' ></progress><br>"
				html += "    <div class='close' data-idx=" + idx + ">X</div>"
				html += "    <div>" + file.name + "</div>"
				html += "</div>"

				$div = $(html);
				$("#thumbnails").append($div);
				file.target = $div;
			}
		}

		var mode = 1; //0:여러 파일을 한번에 업로드, 1:여러 파일을 각각 차례대로 업로드
		var uploadStatus = {
			total : 0,
			count : 0
		};
		$("#btnSubmit").on("click", function(e) {
			if (mode == 0)
				groupUpload();
			else if (mode == 1) {
				$.each(uploadFiles, function(i, file) {
					if (file.upload != 'disable')
						uploadStatus.total++;
				});
				eachUpload();
			}
		});
		//전체파일 한번에 업로드
		function groupUpload() {
			var formData = new FormData();
			$.each(uploadFiles, function(i, file) {
				if (file.upload != 'disable')
					formData.append('files', file, file.name);
			});
			$.ajax({
				url : contextPath + "/uploadAjax.json",
				data : formData,
				enctype : 'multipart/form-data',
				type : 'post',
				contentType : false,
				processData : false,
				xhr : function() { //XMLHttpRequest 재정의 가능
					var xhr = $.ajaxSettings.xhr();
					xhr.upload.onprogress = function(e) { //progress 이벤트 리스너 추가
						var percent = e.loaded * 100 / e.total;
						setProgress(percent);
					};
					return xhr;
				},
				success : function(ret) {
					alert("완료");
				}
			});
		}
		//개별 파일 업로드
		function eachUpload() {
			var file = uploadFiles.shift();
			if (!file) {
				setTimeout(alert('완료'), 300);
				return;
			}
			if (file.upload == 'disable') {
				eachUpload();
				return;
			}
			var formData = new FormData();
			formData.append('files', file, file.name);
			var $selfProgress = file.target.find("progress"); //File 객체에 저장해둔 프리뷰 DOM의 progress 요소를 찾는다.

			$.ajax({
				url : contextPath + "/uploadAjax.json",
				data : formData,
				type : 'post',
				enctype : 'multipart/form-data',
				dataType : 'text',
				contentType : false,
				processData : false,
				xhr : function() { //XMLHttpRequest 재정의 가능

					var xhr = $.ajaxSettings.xhr();
					xhr.upload.onprogress = function(e) { //progress 이벤트 리스너 추가
						if (e.lengthComputable) {
							var percent = e.loaded * 100 / e.total;
							$selfProgress.val(percent); //개별 파일의 프로그레스바 진행
						}
					};
					return xhr;

				},
				success : function(ret) {
					uploadStatus.count++;
					setProgress(uploadStatus.count / uploadStatus.total * 100);
					setTimeout(eachUpload, 500);
				}
			});
		}
		var $progressBar = $("#progressBar");

		function setProgress(per) {
			$progressBar.val(per);
		}

		$(document).on("click", ".close", function() {
			var $target = $(this);
			var idx = $target.attr('data-idx');
			uploadFiles[idx].upload = 'disable';
			$target.parent().remove();
		});

	})
</script>



<div id="drop" style="border: 1px solid black; width: 630px; height: 340px; padding: 3px">
	여기로 drag, drop
	<div id="thumbnails">
		<progress id="progressBar" value="0" max="100" style="width: 100%"></progress>
	</div>
</div>
<input type="button" id="btnSubmit" value="upload" />


