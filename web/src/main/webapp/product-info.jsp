<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
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
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
          content="830889560506-bfd7gjnpsj4o3ss6n24f2pis4dscu4u9.apps.googleusercontent.com">
</head>
<body class="bg-dark">
<div class="container">
    <%@include file="header.jsp"%>
    <%@include file="links.jsp"%>
    <div>
        <div class="row mt-3 pl-2 pr-2 pt-3 pb-3 border border-secondary">
            <c:choose>
                <c:when test="${errMsg != null}">
                    <div class="col errorMessage">
                        <h5>Wystąpił problem:</h5>
                        <c:out value="${errMsg}"/>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-12">
                        <div class="row">
                            <h4>
                                Produkt: <c:out value="${product.toString()}"/>
                            </h4>
                        </div>
                        <div class="row">
                            <c:choose>

                                <c:when test="${error == null}">
                                    <c:forEach var="phrase" items="${phraseMap}">

                                        <c:forEach var="breadCrumbs" items="${breadCrumbsMap}">
                                            <c:if test="${phrase.key==breadCrumbs.key}">
                                                <div>
                                                    Kategoria: <c:out value="${phrase.key.catName}"/>,
                                                    ID:<c:out value="${phrase.key.catId}"/>
                                                    <a target="_blank" href="${phrase['value']}"><c:out
                                                            value="${breadCrumbs.value}"/>
                                                    </a>
                                                    <br>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${error != null}">
                                    <div class="errorMessage">
                                        Nie znaleziono kategorii dla tego produktu
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>

                    <div class="col-8">
                        <div class="row mt-3 pl-2 pr-2 pt-3">
                            <img class="img-fluid" src="${localImg}">
                        </div>
                    </div>
                    <div class="col-4">
                            <%--<div class="row">--%>
                        <img class="img-fluid" src="${product.getProductImage()}">
                            <%--</div>--%>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="row m-0">
            <span class="mx-auto p-2">&#169 infoShare Academy</span>
        </div>
    </div>
</div>
</body>
</html>
