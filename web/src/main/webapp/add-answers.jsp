<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="what" var="WDYWlanguage" scope="session"/>

<html lang="pl">
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
    <div>
        <div class="row mt-3 pl-2 pr-2 pt-3 border border-secondary">
            <form method="post" action="add-answers">
                <div class="questionForm row">
                    <div col-lg-12 style="width: 800px">
                        <h7><fmt:message key="addAnswer.addChange" bundle="${WDYWlanguage}"/></h7>
                        <div id="categoryName">${sessionScope.question.questionName}</div>
                        <br/>
                        <div>
                            <ol type="a">
                                <c:forEach var="alist" items="${sessionScope.question.answerList}">
                                    <div class="row">
                                        <div class="col-lg-1 questRadio">
                                            <c:if test="${isUpdateAnswer==true}">
                                                <c:if test="${alist.answerId == radioAnswerId}">
                                                    <input type="radio" name="answerRadio" value="${alist.answerId}"
                                                           formmethod="post"
                                                           formaction="add-answers" checked/>
                                                </c:if>
                                                <c:if test="${alist.answerId != radioAnswerId}">
                                                    <input type="radio" name="answerRadio" value="${alist.answerId}"
                                                           formmethod="post"
                                                           formaction="add-answers">
                                                </c:if>

                                            </c:if>
                                        </div>
                                        <div class="col-lg-11">
                                            <li> ${alist.answerName} <fmt:message key="addAnswer.category"
                                                                                  bundle="${WDYWlanguage}"/> <a
                                                    href="${alist.relatedCategory.categoryAllegroLink}">${alist.relatedCategory.categoryName}</a>
                                            </li>
                                        </div>
                                    </div>
                                </c:forEach>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="questionForm row">
                    <div class="row">
                        <div class="col-lg-11">
                            <label><fmt:message key="addAnswer.answer" bundle="${WDYWlanguage}"/> </label><br/><input
                                size="80" name="answerName" type="text"
                                value="${answer.answerName}" minlength="3" required/><br/><br/>
                            <label><fmt:message key="addAnswer.category" bundle="${WDYWlanguage}"/> </label><br/><input
                                size="40" name="categoryName" type="text"
                                value="${answer.relatedCategory.categoryName}" minlength="3" required/><br/><br/>
                            <label><fmt:message key="addAnswer.link" bundle="${WDYWlanguage}"/></label><br/><input
                                size="60" name="categoryAllegroLink"
                                type="text"
                                value="${answer.relatedCategory.categoryAllegroLink}" minlength="3" required/><br/><br/>
                        </div>
                        <div class="col-lg-1">
                            <c:if test="${isUpdateAnswer==true}">
                                <input class="button" type="submit" name="edit-answer" value=<fmt:message
                                        key="addAnswer.edit" bundle="${WDYWlanguage}"/>>
                            </c:if>
                        </div>

                    </div>
                    <div><input class="button" type="submit" name="add-answer" value=<fmt:message key="addAnswer.save"
                                                                                                  bundle="${WDYWlanguage}"/>>
                    </div>
                    <c:if test="${isUpdateAnswer!=true}">
                        <div><input class="button" type="submit" name="add-next-answer" value=<fmt:message
                                key="addAnswer.addAnother" bundle="${WDYWlanguage}"/>>
                        </div>
                    </c:if>
                    <c:if test="${isUpdateAnswer==true}">
                        <div><input class="button" type="submit" name="remove-answer"
                                    value="<fmt:message key="addAnswer.remove" bundle="${WDYWlanguage}"/>"></div>
                    </c:if>
                </div>
            </form>
        </div>
        <div class="row m-0">
            <span class="mx-auto p-2">&#169 infoShare Academy</span>
        </div>
    </div>
</div>
</body>
</html>