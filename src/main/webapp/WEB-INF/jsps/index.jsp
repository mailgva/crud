<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Books</title>
     <meta charset="UTF-8">
     <style>body { padding:20px; }</style>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
     <!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" /> -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular-sanitize.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular-resource.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular-route.js"></script>
        <script src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <script src="/js/angular.js?v=237"></script>
</head>
<body>
  <h3>List of Books</h3>
  <a href="/readonly"  class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Only View</a>
  <a href="/simplestyle"  class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Simple style</a>
  <a href="/edit/0"     class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Add new book</a>
        <div class="container" ng-app="app">
          <div ng-controller="getallbooksController" class="col-md-3" ng-init="getAllBooks()">
            <button ng-click="getAllBooks()" type="button" class="btn btn-primary btn-xs">Refresh</button><br />
            <label>Search: </label>
            <input type="text" style="250px;" ng-model="searchData">
            <button ng-click="getBooksByPartData()" type="button" class="btn btn-primary btn-xs">Ok</button>
                <table class="table table-striped table-condensed table-hover">
                <thead>

                    <tr>
                        <th class="title" custom-sort order="'title'" sort="sort">Title&nbsp;</th>
                        <th class="description" custom-sort order="'description'" sort="sort">Description&nbsp;</th>
                        <th class="author" custom-sort order="'author'" sort="sort">Author&nbsp;</th>
                        <th class="isbn" custom-sort order="'isbn'" sort="sort">ISBN&nbsp;</th>
                        <th class="printYear" custom-sort order="'printYear'" sort="sort">Year&nbsp;</th>
                        <th >Options &nbsp;</th>

                    </tr>
                </thead>
                <tfoot>
                    <td colspan="6">
                        <div class="pagination pull-right">
                            <ul class="pagination">
                                <li ng-class="{disabled: currentPage == 0}">
                                    <a href ng-click="prevPage()">&#171; Prev</a>
                                </li>

                                <li ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap) "
                                    ng-class="{active: n == currentPage}"
                                ng-click="setPage()">
                                    <a href ng-bind="n + 1">1</a>
                                </li>

                                <li ng-class="{disabled: (currentPage) == pagedItems.length - 1}">
                                    <a href ng-click="nextPage()">Next &#187;</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tfoot>

                <tbody>
                    <tr ng-repeat="item in pagedItems[currentPage] | orderBy:sort.sortingOrder:sort.reverse">
                        <td><div style="width:200px">{{item.title}}</div></td>
                        <td><div style="width:400px">{{item.description}}</div></td>
                        <td><div style="width:150px">{{item.author}}</div></td>
                        <td><div style="width:100px">{{item.isbn}}</div></td>
                        <td><div style="width:100px">{{item.printYear}}</div></td>
                        <td>
                           <div style="width:100px">
                              <a ng-show={{!item.readAlready}} href="read/{{item.id}}" class="btn btn-success btn-block btn-sm" role="button">Alredy read</a>
                              <a href="edit/{{item.id}}" class="btn btn-warning btn-block btn-sm" role="button">Edit</a>
                              <a href="delete/{{item.id}}" class="btn btn-danger btn-block btn-sm" role="button">Delete</a>
                           </div>
                        </td>
                    </tr>
                </tbody>
            </table>


         </div>
        </div>
    </body>
</html>
