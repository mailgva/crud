var app = angular.module('app',[]);

app.controller('BookCRUDCtrl', ['$scope','BookCRUDService', function ($scope,BookCRUDService) {

    $scope.updateBook = function () {
        BookCRUDService.updateBook($scope.book.id,$scope.book.title,$scope.book.description,
                    $scope.book.author, $scope.book.isbn, $scope.book.printYear, $scope.book.readAlready)
          .then(function success(response){
              $scope.message = 'Book data updated!';
              $scope.errorMessage = '';
          },
          function error(response){
              $scope.errorMessage = 'Error updating book!';
              $scope.message = '';
          });
    }

    $scope.getBook = function () {
        BookCRUDService.getBook($scope.book.id)
          .then(function success(response){
              $scope.book = response.data;
              $scope.message='';
              $scope.errorMessage = '';
          },
          function error (response ){
              $scope.message = '';
              if (response.status === 404){
                  $scope.errorMessage = 'Book not found!';
              }
              else {
                  $scope.errorMessage = "Error getting book!";
              }
          });
    }

    $scope.addBook = function () {
        if ($scope.book != null && $scope.book.title) {
            BookCRUDService.addBook($scope.book.title,$scope.book.description,
                      $scope.book.author, $scope.book.isbn, $scope.book.printYear, $scope.book.readAlready)
              .then (function success(response){
                  $scope.message = 'Book added!';
                  $scope.errorMessage = '';
              },
              function error(response){
                  $scope.errorMessage = 'Error adding book!';
                  $scope.message = '';
            });
        }
        else {
            $scope.errorMessage = 'Please enter a name!';
            $scope.message = '';
        }
    }

    $scope.deleteBook = function () {
        BookCRUDService.deleteBook($scope.book.id)
          .then (function success(response){
              $scope.message = 'Book deleted!';
              $scope.book = null;
              $scope.errorMessage='';
          },
          function error(response){
              $scope.errorMessage = 'Error deleting book!';
              $scope.message='';
          })
    }

    $scope.getAllBooks = function () {
        BookCRUDService.getAllBooks()
          .then(function success(response){
              $scope.books = response.data;
              $scope.message='';
              $scope.errorMessage = '';
          },
          function error (response ){
              $scope.message='';
              $scope.errorMessage = 'Error getting books!';
          });



    }

}]);

app.service('BookCRUDService',['$http', function ($http) {

    this.getBook = function getBook(id){
        return $http({
          method: 'GET',
          url: 'books/'+id
        });
	}

    this.addBook = function addBook(title, description, author, isbn, printYear, readAlready){
        //alert(title + "\r\n" +description + "\r\n" +author + "\r\n" +isbn + "\r\n" +printYear + "\r\n" +readAlready );
        return $http({
          method: 'POST',
          url: 'books',
          data: {title:title, description:description, author:author, isbn:isbn, printYear:printYear, readAlready:readAlready}
        });
    }

    this.deleteBook = function deleteBook(id){
            return $http({
              method: 'GET',
              url: 'books/delete/'+id
            })
        }
    /*
    this.deleteBook = function deleteBook(id){
        return $http({
          method: 'DELETE',
          url: 'books/'+id
        })
    }
    */

    this.updateBook = function updateBook(id,title, description, author, isbn, printYear, readAlready){
        return $http({
          method: 'PATCH',
          url: 'books/'+id,
          data: {id:id, title:title, description:description, author:author, isbn:isbn, printYear:printYear, readAlready:readAlready}
        })
    }

    this.getAllBooks = function getAllBooks(){
        return $http({
          method: 'GET',
          url: 'books'
        });
    }

}]);