<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tiny.cloud/1/omjcnn5e647lx0jwm8neb7k3o37nkkx0hrgiaxjo1oc1bnvd/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
          selector: '#content-area',
          height : 600,
          resize : false,
          plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
          toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
        });
     </script>
    <style>
        div{
            
            box-sizing: border-box;
        }
        .email-area{
            width: 800px;
            height: 900px;
            margin: auto;
        }
        .email-area>div{
            width: 100%;
        }
        #email-header{
            height: 6%;
        }
        #email-content{
            height: 94%;
        }
        #email-info{
            width: 100%;
            line-height: 45px;
        }
        #email-info input{
            height: 40px;
            width: 85%;
        }
        #status{
            margin-top: 17px;
            margin-right: 10px;
            margin-left: 19px;
        }
        </style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
<br><br>
	<h1 align="center">메일 쓰기</h1>
	<br>
    <form action="send.em" method="post" enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class ="email-area">
            <div id="email-header">
                <nav class="navbar navbar-default">
                    <ul class="nav navbar-nav">
                        <li style="top: 10px;left:10px;margin-right: 25px;height:50px;">
                        	<button type="submit" class="btn btn-success" style="border:0;background-color: #0E6251;">보내기</button>
                        </li>
                    </ul>
                </nav>
            </div>
            <hr>
            <div id="email-content">
               <table id="email-info">
                    <tbody>
                        <tr>
                            <td>보내는사람</td>
                            <td><input type="text" name="sender" id="sender"></td>
                        </tr>
                        <tr>
                            <td>받는사람</td>
                            <td><input type="text" name="receiver" id="receiver"></td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="emailTitle" id="email-title"></td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td><input type="file" id="upfile" name="upfile"></td>
                        </tr>
                    </tbody>
               </table>
               <hr>
               <textarea name="emailContent" id="content-area"></textarea>
            </div>
        </div>
    </form>
</body>
</html>
