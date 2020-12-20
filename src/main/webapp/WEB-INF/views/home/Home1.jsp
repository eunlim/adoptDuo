<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/resources/js/home/Home.js"/>"></script>
 
	<style>
        
        .filebox label {
		  display: inline-block;
		  padding: .5em .75em;
		  color: #fff;
		  font-size: inherit;
		  line-height: normal;
		  vertical-align: middle;
		  background-color: #5cb85c;
		  cursor: pointer;
		  border: 1px solid #4cae4c;
		  border-radius: .25em;
		  -webkit-transition: background-color 0.2s;
		  transition: background-color 0.2s;
		}
		
		.filebox label:hover {
		  background-color: #6ed36e;
		}
		
		.filebox label:active {
		  background-color: #367c36;
		}
		
		.filebox input[type="file"] {
		  position: absolute;
		  width: 1px;
		  height: 1px;
		  padding: 0;
		  margin: -1px;
		  overflow: hidden;
		  clip: rect(0, 0, 0, 0);
		  border: 0;
		}

        #fileDragDesc {
            width: 100%; 
            height: 180px; 
            margin-left: auto; 
            margin-right: auto; 
            padding: 5px; 
            text-align: center; 
            line-height: 200px; 
            vertical-align:middle;
        }
        
        #fileTableThead tr td {
        	border: 1px solid black;
        }
	</style>
		


<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>


        <div class="filebox"> 
        	<label for="input_file">내 PC</label> 
        	<input type="file" id="input_file" multiple="multiple"> 
        </div>

        
        
        <br/>
    
        <form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
    
            <div id="dropZone" style="width: 50%; height: 250px; border-style: solid; border-color: black; overflow-y: scroll; overflow-x: hidden">
                <div id="fileDragDesc"> 파일을 드래그 해주세요. </div>
            
                
                <table id="fileListTable" style="width: 100%">
                	
                	<thead id="fileTableThead">
                		<tr>
                			<td>파일이름</td>
                			<td>크기</td>
                			<td>삭제</td>
                		</tr>
                	</thead>
                
                    <tbody id="fileTableTbody">
    
                    </tbody>
                    
                </table>
                
            </div>
    
        </form>
        
        
        <input type="button" onclick="contents.uploadFile(); return false;" class="btn bg_01" value="파일 업로드">
        <br>

