<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<html>
	<head>
		<meta charset='utf-8' />
		<link href="${conPath}/js/fullcalendar-5.0.1/lib/main.css" rel="stylesheet" />
		<script src="${conPath}/js/fullcalendar-5.0.1/lib/main.js"></script>
		<script src="${conPath}/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>
	  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	  <style>
	  	#calendar{
	  		margin: auto;
	  		margin-top: 80px;
	  		max-width: 800px;
	  		text-align: center;
	  	}
	  </style>
	  <script>
	  document.addEventListener('DOMContentLoaded', function () {
          $(function () {
              var request = $.ajax({
                  url: "${conPath}/group/schedule/list.do?gid="+${gid},
                  method: "GET",
                  dataType: "json"
              });

              request.done(function (data) {
                  console.log(data);

                  var calendarEl = document.getElementById('calendar');

                  var calendar = new FullCalendar.Calendar(calendarEl, {
                      initialView: 'dayGridMonth',
                      headerToolbar: {
                          left: 'prev,next',
                          center: 'title',
                      },
                      editable: true,
                      droppable: true,
                      drop: function (arg) {
                          if (document.getElementById('drop-remove').checked) {
                              arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                          }
                      },
                      events: data
                  });

                  calendar.render();
              });

              request.fail(function( jqXHR, textStatus ) {
                  alert( "Request failed: " + textStatus );
              });
          });

      });
	  </script>
	</head>
	<body>
    <div id='calendar'></div>
  </body>
</html>