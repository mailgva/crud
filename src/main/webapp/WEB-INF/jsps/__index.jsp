<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Books</title>
     <meta charset="UTF-8">
     <link rel="stylesheet"
                   href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular-sanitize.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular-resource.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular-route.js"></script>
        <script src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js"></script>


    <script src="/js/angdemo.js?v=214"></script>
</head>
<body>
  <h3>List of Books</h3>
  <a href="/viewstyle"  class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Only View</a>
  <a href="/edit/0"     class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Add new book</a>
        <div class="container" ng-app="app">
          <div ng-controller="getallbooksController" class="col-md-3" ng-init="getAllBooks()">
            <button ng-click="getAllBooks()" type="button" class="btn btn-primary btn-xs">Refresh</button>

            <table ng-table="tableParams" class="table table-condensed table-bordered table-striped" >
                <tr ng-repeat="book in allBooks">
                    <td title="'Title'" filter="{ title: 'text'}" sortable="'title'">
                        {{book.title}}</td>
                    <td title="'Description'" filter="{ description: 'text'}" sortable="'description'">
                        <div style="width:400px">
                            {{book.description}}
                        </div>
                    </td>
                    <td title="'Author'" filter="{ author: 'text'}" sortable="'author'">
                        {{book.author}}</td>
                    <td title="'ISBN'" filter="{ isbn: 'text'}" sortable="'isbn'">
                        {{book.isbn}}</td>
                    <td title="'Year'" filter="{ printYear: 'number'}" sortable="'printYear'">
                        {{book.printYear}}</td>
                    <td title="'Options'">
                            <a ng-show={{!book.readAlready}} href="read/{{book.id}}" class="btn btn-success btn-block btn-sm" role="button">Alredy read</a>
                            <a href="edit/{{book.id}}" class="btn btn-warning btn-block btn-sm" role="button">Edit</a>
                            <a href="delete/{{book.id}}" class="btn btn-danger btn-block btn-sm" role="button">Delete</a>
                    </td>
                </tr>
            </table>

         </div>
        </div>
    </body>
</html>
