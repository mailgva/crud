var app = angular.module("app", []);

app.controller('postController', function($scope, $http, $location, $window) {
    $scope.getBook = function(){
        var bookId = $("#bookId").val();

        var url = "/books/" +  bookId;

        var config = {
            headers : {
                'Content-Type': 'application/json;charset=utf-8;'
            }
        }

        $http.get(url, config).then(function(response) {
            if (response != null) {
                $scope.book = response.data;
                $scope.id = $scope.book.id;
                $scope.title = $scope.book.title;
                $scope.description = $scope.book.description;
                $scope.author = $scope.book.author;
                $scope.isbn = $scope.book.isbn;
                $scope.printYear = $scope.book.printYear;
      } else {
                $scope.getResultMessage = "get All Books Data Error!";
            }

        }, function(response) {
            $scope.getResultMessage = "Fail!";
        });

    }


    $scope.submitForm = function(){
        var url = "/postbook";

        var config = {
            headers : {
                'Content-Type': 'application/json;charset=utf-8;'
            }
        }
        var bookId = (typeof($scope.id) !== "undefined"  || $scope.id === null ? $scope.id : 0);
        var data = {

            id: bookId,
            title: $scope.title,
            description: $scope.description,
            author: $scope.author,
            isbn: $scope.isbn,
            printYear: $scope.printYear

        };

        $http.post(url, data, config).then(function (response) {
            $scope.postResultMessage = "Готово!";
        }, function (response) {
            $scope.postResultMessage = "Ошибка!";
        });

        if(bookId != 0)
            $window.location.href = '/';
    }
});