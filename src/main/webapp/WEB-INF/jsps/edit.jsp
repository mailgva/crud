<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script
                src="http://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js"></script>

        <link rel="stylesheet"
              href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />

    <script src="/js/angularedit.js?v=4"></script>

</head>
<body>
<a href="/" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Back to Books</a>
<div class="container" ng-app="app">

        <c:if test="${not empty book.id}">
           <h1>Edit Book</h1>
           <c:set var = "$scope.id" scope = "session" value = "${book.id}"/>
           <script>
            angular.module('app').value('id', <c:out value = "${id}"/>);
           </script>

        </c:if>
        <c:if test="${empty book.id}">
           <h1>Add Book</h1>
        </c:if>

    <div class="row">
        <div ng-controller="postController" class="col-md-3" ng-init="getBook()">
            <form name="customerForm" ng-submit="submitForm()">
                <input type="hidden" id="bookId" value="${id}"  />
                <input type="hidden" name="id" class="form-control"  ng-model="id"  />
                <label>Author</label>
                <input type="text" name="author"class="form-control" ng-model="author"
                     <c:if test="${not empty book.id}">
                        <c:out value = "disabled "/>
                     </c:if>
                />
                <label>Title</label>
                <input type="text" name="title"	class="form-control"  ng-model="title"/>
                <label>Description</label>
                <input type="text" name="description" class="form-control" ng-model="description" />

                <label>ISBN</label>
                <input type="text" name="isbn" class="form-control" ng-model="isbn" />
                <label>Print year</label>
                <input type="text" name="printYear" class="form-control" ng-model="printYear" />

                <button type="submit" class="btn btn-primary">Submit</button>
                <p>{{postResultMessage}}</p>
            </form>
        </div>
    </div>
</div>
</body>
</html>