<!DOCTYPE html>
<html ng-app="app">
<head>
    <meta charset="UTF-8">
    <title>Simple style</title>
    <style>body { padding:20px; }</style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <script src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js"></script>
    <script src="/js/angularsimp.js?v=4"></script>

</head>
<body>
<h3>Simple style</h3>
<a href="/" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Back to Editable style</a>
<br />
<div class="container" ng-app="app">
    <div ng-controller="BookCRUDCtrl">
    <table>
        <tr>
            <td width="100">ID:</td>
            <td><input style="250px;" type="text" id="id" ng-model="book.id" /></td>
        </tr>
        <tr>
            <td width="100">Title:</td>
            <td><input style="250px;" type="text" id="title" ng-model="book.title" /></td>
        </tr>
        <tr>
            <td width="100">Description:</td>
            <td><input style="250px;" type="text" id="description" ng-model="book.description" /></td>
        </tr>
        <tr>
            <td width="100">Author:</td>
            <td><input style="250px;" type="text" id="author" ng-model="book.author" /></td>
        </tr>
        <tr>
            <td width="100">ISBN:</td>
            <td><input style="250px;" type="text" id="isbn" ng-model="book.isbn" /></td>
        </tr>
        <tr>
            <td width="100">Year:</td>
            <td><input style="250px;" type="text" id="printYear" ng-model="book.printYear" /></td>
        </tr>
        <tr>
            <td width="100">Read:</td>
            <td><input style="250px;" type="text" id="readAlready" ng-model="book.readAlready" /></td>
        </tr>
    </table>
    <br /> <br />
    <div class="btn-group">
        <a class="btn btn-primary" ng-click="getBook(book.id)">Get Book</a>
        <a class="btn btn-primary" ng-click="updateBook(book.id,book.title,book.description,book.author,book.isbn,book.printYear,book.readAlready)">Update Book</a>
        <a class="btn btn-primary" ng-click="addBook(book.title,book.description,book.author,book.isbn,book.printYear,book.readAlready)">Add Book</a>
        <a class="btn btn-primary" ng-click="deleteBook(book.id)">Delete Book</a>
    </div>

    <br />
    <p style="color: green">{{message}}</p>
    <p style="color: red">{{errorMessage}}</p>


    <br />
    <a ng-click="getAllBooks()">Get all Books</a><br />
    <br /> <br />
    <table ng-table="tableParams" class="table table-condensed table-bordered table-striped">
                    <tr ng-repeat="row in books">
                        <td title="'Title'" filter="{ title: 'text'}" sortable="'title'">
                            {{row.title}}</td>
                        <td title="'Description'" filter="{ description: 'text'}" sortable="'description'">
                            {{row.description}}</td>
                        <td title="'Author'" filter="{ author: 'text'}" sortable="'author'">
                            {{row.author}}</td>
                        <td title="'ISBN'" filter="{ isbn: 'text'}" sortable="'isbn'">
                            {{row.isbn}}</td>
                        <td title="'Year'" filter="{ printYear: 'number'}" sortable="'printYear'">
                            {{row.printYear}}</td>
                        <td title="'Read'" filter="{ readalready: 'text'}" sortable="'readAlready'">
                            {{row.readAlready}}</td>

                    </tr>
     </table>


    </div>
</div>
</body>
</html>