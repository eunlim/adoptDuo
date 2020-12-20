<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<button id="opt01">기상청</button>

<script>
	$(document).ready(function() {
		$("#opt01").click(function() {
			window.open("http://www.kma.go.kr");
		});
	});
</script>


<!-- 
 <script src="https://cdn.ckeditor.com/4.14.0/standard-all/ckeditor.js"></script>
 
 <textarea cols="80" id="editor1" name="editor1" rows="10">
 
 </textarea>
 
 <script>
 	$(function(){
 		

 	    CKEDITOR.replace('editor1', {
 	      toolbar: [
 	        {
 	          name: 'clipboard',
 	          items: ['Undo', 'Redo']
 	        },
 	        {
 	          name: 'styles',
 	          items: ['Format', 'Font', 'FontSize']
 	        },
 	        {
 	          name: 'colors',
 	          items: ['TextColor', 'BGColor']
 	        },
 	        {
 	          name: 'align',
 	          items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
 	        },
 	        '/',
 	        {
 	          name: 'basicstyles',
 	          items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'CopyFormatting']
 	        },
 	        {
 	          name: 'links',
 	          items: ['Link', 'Unlink']
 	        },
 	        {
 	          name: 'paragraph',
 	          items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
 	        },
 	        {
 	          name: 'insert',
 	          items: ['Table']
 	        },
 	        {
 	          name: 'tools',
 	          items: ['Maximize']
 	        },
 	        {
 	          name: 'editing',
 	          items: ['Scayt']
 	        }
 	      ],

 	      extraAllowedContent: 'h3{clear};h2{line-height};h2 h3{margin-left,margin-top}',

 	      // Adding drag and drop image upload.
 	      extraPlugins: 'print,format,font,colorbutton,justify,uploadimage',
 	      uploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',

 	      // Configure your file manager integration. This example uses CKFinder 3 for PHP.
 	      filebrowserBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html',
 	      filebrowserImageBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html?type=Images',
 	      filebrowserUploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files',
 	      filebrowserImageUploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Images',

 	      height: 560,

 	      removeDialogTabs: 'image:advanced;link:advanced'
 	    });
 	    
 	   CKEDITOR.on('dialogDefinition', function ( ev ){
 		   if(ev.data.name == 'link'){
 		      ev.data.definition.getContents('target').get('linkTargetType')['default']='_blank';
 		   }
 		});
 		
 	}) ; 
 </script> -->