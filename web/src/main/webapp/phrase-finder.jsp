<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setBundle basename="what" var="WDYWlanguage"/>
<fmt:setLocale value="${language}"/>
<!doctype html>
<html lang="${language}">
<head>


    <meta charset="UTF-8">
    <title><fmt:message key="all.mainName" bundle="${WDYWlanguage}"/></title>
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
    <%@include file="header.jsp" %>
    <%@include file="links.jsp" %>
    <%@include file="login-window.jsp" %>
    <div>
        <div class="row mt-3 pl-2 pr-2 pt-3 border border-secondary">
            <div class="col-12 text-center">
                <h3><fmt:message key="phrase.mainInfo" bundle="${WDYWlanguage}"/>
                </h3></div>
            <div class="col-4">
                <form method="POST" action="/phrase-finder">
                    <div class="form-group">
                        <label> <fmt:message key="phrase.inputPhrase" bundle="${WDYWlanguage}"/></label>
                        <input type="text" class="form-control" name="phrase" id="phrase"
                               placeholder="<fmt:message key="phrase.inputMessagePhrase" bundle="${WDYWlanguage}"/>"/>
                    </div>
                    <div class="form-group">
                        <label><fmt:message key="phrase.inputMaxAnswer" bundle="${WDYWlanguage}"/></label>
                        <input type="number" class="form-control" name="limit" id="limit"
                               placeholder=" <fmt:message key="phrase.inputNumberHelper" bundle="${WDYWlanguage}"/>"
                               min="1"/>
                    </div>
                    <div class="form-group">
                        <input type="submit"
                               value=
                               <fmt:message key="phrase.buttonFind" bundle="${WDYWlanguage}"/> name="search"
                               class="btn btn-primary btn-lg btn-block"/>
                    </div>
                </form>
            </div>
            <div class="col-8">
                <c:choose>

                    <c:when test="${error == null}">
                        <c:forEach var="phrase" items="${phraseMap}">

                            <c:forEach var="breadCrumbs" items="${breadCrumbsMap}">
                                <c:if test="${phrase.key==breadCrumbs.key}">
                                    <div>
                                        =>
                                        <a href="${phrase['value']}" target="_blank"><c:out value="${breadCrumbs.value}" />
                                        </a>
                                        <br/>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${error != null}">
                        <div class="alert alert-danger" role="alert">
                            <fmt:message key="phrase.noCategoryError" bundle="${WDYWlanguage}"/> <c:out
                                value="${error}"> </c:out>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>

    </div>
    <div class="row m-0">
        <span class="mx-auto p-2">&#169 infoShare Academy</span>
    </div>
</div>
</body>
</html>