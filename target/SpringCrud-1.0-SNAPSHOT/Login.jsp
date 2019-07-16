<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <%@include file="componentes/asset.jspf" %>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="container" style="width: 50%">
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading text-center">Inicio de sesion.</h2>
        <h4 class="alert-danger text-center"><span class="text-danger" >${error}</span></h4>
        <div class="form-group">
          
            <input required name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/> </br>
            <input required name="password" type="password" class="form-control" placeholder="Password"/>
            </br>
<!--            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
            <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
            <h4 class="text-center"><a href="${contextPath}/registration">Crear una cuenta</a></h4>
        </div>
    </form>
        
</div>
</body>
</html>
