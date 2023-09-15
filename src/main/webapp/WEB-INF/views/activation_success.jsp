<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS | Ativação com sucesso</title>
    <link rel="stylesheet" href="/css/passwordrecovery.css">
</head>
<body id="login-page">

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/home';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <div class="content">

        <div class="image-container">
            <img class="imagelogo" src="/images/logo_whitebg.png" >
        </div>

        <p class="title">Obrigado </p>
        <p class="subtitle-text">A sua conta foi ativada. Pode pressionar no botão entrar e proceder ao login ou no botão retroceder e regressar à página principal.</p>
        <div class="d-grid">
            <button type="submit" id="buttonentry" class="btn btn-primary buttons" style="margin-top: 140px" onclick="window.location.href='/login';">
                Entrar
            </button>
        </div>

    </div>
</div>

<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>

</body>
</html>