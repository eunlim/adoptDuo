			
		   // 파일 리스트 번호
           var fileIndex = 0;
           // 등록할 전체 파일 사이즈
           var totalFileSize = 0;
           // 파일 리스트
           var fileList = new Array();
           // 파일 사이즈 리스트
           var fileSizeList = new Array();
           // 등록 가능한 파일 사이즈 MB
           var uploadSize = 50;
           // 등록 가능한 총 파일 사이즈 MB
           var maxUploadSize = 500;
   
   
           // 파일 드롭 다운
           function fileDropDown() {
               var dropZone = $("#dropZone");
               $('#fileTableThead').hide();
               
               // Drag기능
               dropZone.on('dragenter', function(e) {// 드래그한 요소나 텍스트 블록을 적합한
														// 드롭 대상위에 올라갔을 때 발생한다.
                   e.stopPropagation();
                   e.preventDefault();
                   // 드롭다운 영역 css
                   dropZone.css('background-color', '#E3F2FC');
               });
               dropZone.on('dragleave', function(e) {// 드래그하는 요소나 텍스트 블록이 적합한
														// 드롭 대상에서 벗어났을 때 발생한다.
                   e.stopPropagation();
                   e.preventDefault();
                   // 드롭다운 영역 css
                   dropZone.css('background-color', '#FFFFFF');
               });
               dropZone.on('dragover', function(e) {// 요소나 텍스트 블록을 적합한 드롭 대상 위로
													// 지나갈 때 발생한다.
                   e.stopPropagation();
                   e.preventDefault();
                   // 드롭다운 영역 css
                   dropZone.css('background-color', '#E3F2FC');
               });
               dropZone.on('drop', function(e) {// 요소나 텍스트 블록을 적합한 드롭 대상에 드롭했을 때
												// 발생한다.
                   e.preventDefault();
                   // 드롭다운 영역 css
                   dropZone.css('background-color', '#FFFFFF');
                   // 최초시작시 y축 스크롤만 생기게 한다.

                   var files = e.originalEvent.dataTransfer.files;
                   if (files != null) {
                       if (files.length < 1) {
                           console.log("폴더 업로드 불가");
                           return;
                       } else {
                           selectFile(files)
                       }
                   } else {
                       alert("ERROR");
                   }
               });
           };
   
           // 파일 선택시
           function selectFile(fileObject) {
               var files = null;
   
               if (fileObject != null) {
                   // 파일 Drag 이용하여 등록시
                   files = fileObject;
               }
   
               // 다중파일 등록
               if (files != null) {
                   
                   if (files != null && files.length > 0) {
                       	$("#fileDragDesc").hide(); 
                       	$("fileListTable").show();
                   } else {
                      	$("#fileDragDesc").show(); 
                       	$("fileListTable").hide();
                   		$('#fileTableThead').hide();
                   }
                   
                   for (var i = 0; i < files.length; i++) {
                       // 파일 이름
                       var fileName = files[i].name;
                       var fileNameArr = fileName.split('\.');
                       // 확장자
                       var ext = fileNameArr[fileNameArr.length - 1];
                       
                       var fileSize = files[i].size; // 파일 사이즈(단위 byte)
                       if (fileSize <= 0) {
                           return;
                       }
                       
                       var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 kb)
                       var fileSizeMb = fileSizeKb / 1024;    // 파일 사이즈(단위 Mb)
                       
                       var fileSizeStr = "";
                       if ((1024*1024) <= fileSize) {    // 파일 용량이 1메가 이상인 경우
                           // console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                           fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
                       } else if ((1024) <= fileSize) {
                           // console.log("fileSizeKb="+parseInt(fileSizeKb));
                           fileSizeStr = parseInt(fileSizeKb) + " kb";
                       } else {
                           // console.log("fileSize="+parseInt(fileSize));
                           fileSizeStr = parseInt(fileSize) + " byte";
                       }
   
                       if ($.inArray(ext, [ 'hwp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'png', 'pdf', 'jpg', 'jpeg', 'gif', 'zip' ]) <= 0) {
                           // 확장자 체크
                           	alert("등록이 불가능한 파일 입니다.("+fileName+")");
                            $("#input_file").val("");
                       } else if (fileSizeMb > uploadSize) {
                           // 파일 사이즈 체크
                           alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                           $("#input_file").val("");
                       } else {
                           // 전체 파일 사이즈
                           totalFileSize += fileSizeMb;
   
                           // 파일 배열에 넣기
                           fileList[fileIndex] = files[i];
   
                           // 파일 사이즈 배열에 넣기
                           fileSizeList[fileIndex] = fileSizeMb;
   
                           // 업로드 파일 목록 생성
                           addFileList(fileIndex, fileName, fileSizeStr);
   
                           // 파일 번호 증가
                           fileIndex++;
                       }
                   }
               } else {
                   alert("ERROR");
               }
           };
   
           // 업로드 파일 목록 생성
           function addFileList(fIndex, fileName, fileSizeStr) {
			
           	$('#fileTableThead').show();
           	
               var html = "";
               html += "<tr id='fileTr_" + fIndex + "'>"
               html += "    <td id='dropZone'>" + fileName + "</td>"
               html += "    <td align='center'>" + fileSizeStr + "</td>"
               html += "    <td align='center'><input value='취소' type='button' href='#' onclick='deleteFile(" + fIndex + "); return false;'></td>"
               html += "</tr>"
   
               // + "<a href='#' onclick='deleteFile(" + fIndex + "); return
				// false;' class='btn small bg_02'> 삭제</a>"
               $('#fileTableTbody').append(html);
           }
   
           // 업로드 파일 삭제
           function deleteFile(fIndex) {
               // console.log("deleteFile.fIndex=" + fIndex);
               // 전체 파일 사이즈 수정
               totalFileSize -= fileSizeList[fIndex];
   
               // 파일 배열에서 삭제
               delete fileList[fIndex];
   
               // 파일 사이즈 배열 삭제
               delete fileSizeList[fIndex];
   
               // 업로드 파일 테이블 목록에서 삭제
               $("#fileTr_" + fIndex).remove();
               
               // console.log("totalFileSize="+totalFileSize);
               
               if (totalFileSize > 0) {
                   	$("#fileDragDesc").hide(); 
                   	$("fileListTable").show();
               } else {
                   	$("#fileDragDesc").show(); 
                   	$("fileListTable").hide();
               		$('#fileTableThead').hide();
               }
           }
   
