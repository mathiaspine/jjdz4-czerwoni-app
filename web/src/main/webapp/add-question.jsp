<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>What do you want?</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/fontello/css/fontello.css" type="text/css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
            integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>
</head>
<body class="bg-dark">
<div class="container">
    <div class="row">
        <div class="col">
            <a href="index.html"><h1>
                <i class="icon-shopping-basket"></i> <span class="d-none d-lg-inline-block">What Do You Want</span>
            </h1></a>
        </div>
        <div class="col text-lg-right text-sm-center text-md-right text-center">
            <div class="dropdown">
                <button class="btn btn-dark dropdown-toggle bg-dark m-3" type="button" id="dropdownMenuButton"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="icon-user"></i> <span class="d-none d-lg-inline-block">Zaloguj się</span>
                </button>
                <div class="dropdown-menu bg-dark dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                    <form class="px-4 py-3">
                        <div class="form-group">
                            <label for="exampleDropdownFormEmail1">Adres e-mail</label>
                            <input type="email" class="form-control" id="exampleDropdownFormEmail1"
                                   placeholder="your@email.com">
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Hasło</label>
                            <input type="password" class="form-control" id="exampleDropdownFormPassword1"
                                   placeholder="Password">
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input">
                                Zapamiętaj mnie
                            </label>
                        </div>
                        <button type="submit" class="btn btn-secondary">Zaloguj się</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" style="color: aliceblue">Nie masz konta? Zapisz się!</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row nav nav-pills nav-fill">
        <div class="nav-item w-25 border-left-0">
            <a class="nav-link" href="#"><i class="icon-barcode"></i> <span class="d-none d-lg-inline-block">Kod kreskowy</span></a>
        </div>
        <div class="nav-item w-25">
            <a title="Odpowiedz na kilka pytań aby wybrać najlepszą kategorię produktów" class="nav-link" href="questions"><i class="icon-cart-arrow-down"></i> <span class="d-none d-lg-inline-block">Pomocnik zakupowy</span></a>
        </div>
        <div class="nav-item w-25">
            <a class="nav-link" href="#"><i class="icon-search"></i> <span class="d-none d-lg-inline-block">Wyszukiwarka Allegro</span></a>
        </div>
        <div class="nav-item w-25">
            <a class="nav-link" href="#"><i class="icon-tags"></i> <span class="d-none d-lg-inline-block">Kategorie Allegro</span></a>
        </div>
    </div>
    <div>
        <div class="row mt-3 pl-2 pr-2 pt-3 border border-secondary">
            <h4 id="questionTitle">Dodawanie pytań</h4><br/>
            <c:if test="${sessionScope.mode != 'editMode'}">
                <form class="questionForm" method="post" action="add-question">
                        <%--<label>Treść pytania: </label><br/><input size="80" name="questionName" type="text" value="${question.questionName}"/> <br/><br/>--%>
                    <label>Treść pytania: </label><br/><input size="80" name="questionName" type="text"/> <br/><br/>
                        <%--<label>Poziom pytania: </label><br/><input size="20" name="questionLevel" type="text" value="${guestion.questionLevel}"/> <br /><br />--%>
                    <label>Poziom pytania: </label><br/><input size="20" name="questionLevel" type="text"/>
                    <div class="errorMessage">${NFErrorMessage}</div>
                    <br/>
                    <label>Wybierz odpowiedź nadrzędną: </label><br/>
                    <select name="answer">
                        <option value="wybierz odpowiedź">Wybierz odpowiedź</option>
                        <c:forEach var="list" items="${sessionScope.answersList}">
                            <option value="${list.answerId}">${list.answerName}</option>
                        </c:forEach>
                    </select><br/><br/>
                    <input class="button" type="submit" name="add-question" value="Dalej"/>
                </form>
            </c:if>
        </div>
        <div class="row m-0">
            <span class="mx-auto p-2">&#169 infoShare Academy</span>
        </div>
    </div>
</div>
</body>
</html>