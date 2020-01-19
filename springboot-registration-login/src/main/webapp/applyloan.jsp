<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>
  </div>
  <div class="container">
<p id="data">data</p>
<form id="theform" method="POST" action="http://hackathon1.southcentralus.cloudapp.azure.com:8090/rest/loans">
    <input type="text" id="text" name="text" value="Amount" />
    <input type="text" id="text" name="text" value="Tenure" />
    <input type="submit" id="button" name="submit-button" value="Submit" />
</form>
  </div>
  <script>
var data = new FormData();
data.append("amount", "108\n");
data.append("term", "30");

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://hackathon1.southcentralus.cloudapp.azure.com:8090/rest/loans");
xhr.setRequestHeader("Content-Type", "multipart/form-data; boundary=--------------------------800452430068350707574211");

xhr.send(data);
</script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
