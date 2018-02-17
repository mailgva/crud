var app = angular.module("app", []);
app.controller('getallbooksController', function($scope, $http, $location, $filter) {

    $scope.getBooksByPartData = function() {
            var url = $location.absUrl() +  ($scope.searchData != "" ? "search/" + $scope.searchData : "all");

            var config = {
                headers : {
                    'Content-Type' : 'application/json;charset=utf-8;'
                }
            }

            $http.get(url, config).then(function(response) {
                if (response != null) {
                    $scope.allBooks = response.data;
                    $scope.setParams();
                } else {
                    $scope.getResultMessage = "get All Books Data Error!";
                }

            }, function(response) {
                $scope.getResultMessage = "Fail!";
            });

     }





    $scope.getAllBooks = function() {
        var url = $location.absUrl() + "all";

        var config = {
            headers : {
                'Content-Type' : 'application/json;charset=utf-8;'
            }
        }

        $http.get(url, config).then(function(response) {
            if (response != null) {
                $scope.allBooks = response.data;
                $scope.setParams();

            } else {
                $scope.getResultMessage = "get All Books Data Error!";
            }

        }, function(response) {
            $scope.getResultMessage = "Fail!";
        });

    }

  // inserted script ====================================
    $scope.sort = {
                                              sortingOrder : 'id',
                                              reverse : false
                                          };

    $scope.setParams = function() {                          // init



                                  $scope.filteredItems = [];
                                  $scope.groupedItems = [];
                                  $scope.itemsPerPage = 10;
                                  $scope.pagedItems = [];
                                  $scope.currentPage = 0;
                                  $scope.items = $scope.allBooks;
                                  $scope.gap = parseInt($scope.items.length / 10) + ($scope.items.length % 10  == 0 ? 0 : 1);
                                  var searchMatch = function (haystack, needle) {
                                      if (!needle) {
                                          return true;
                                      }
                                      return haystack.toLowerCase().indexOf(needle.toLowerCase()) !== -1;
                                  };

                                  // init the filtered items
                                  $scope.search = function () {
                                      $scope.filteredItems = $filter('filter')($scope.items, function (item) {
                                          for(var attr in item) {
                                              if (searchMatch(item[attr], $scope.query))
                                                  return true;
                                          }
                                          return false;
                                      });
                                      // take care of the sorting order
                                      if ($scope.sort.sortingOrder !== '') {
                                          $scope.filteredItems = $filter('orderBy')($scope.filteredItems, $scope.sort.sortingOrder, $scope.sort.reverse);
                                      }
                                      $scope.currentPage = 0;
                                      // now group by pages
                                      $scope.groupToPages();
                                  };


                                  // calculate page in place
                                  $scope.groupToPages = function () {
                                      $scope.pagedItems = [];

                                      for (var i = 0; i < $scope.filteredItems.length; i++) {
                                          if (i % $scope.itemsPerPage === 0) {
                                              $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
                                          } else {
                                              $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
                                          }
                                      }
                                  };

                                  $scope.range = function (size,start, end) {
                                      var ret = [];
                                      //console.log(size,start, end);

                                      if (size < end) {
                                          end = size;
                                          start = size-$scope.gap;
                                      }
                                      for (var i = start; i < end; i++) {
                                          ret.push(i);
                                      }
                                       //console.log(ret);
                                      return ret;
                                  };

                                  $scope.prevPage = function () {
                                      if ($scope.currentPage > 0) {
                                          $scope.currentPage--;
                                      }
                                  };

                                  $scope.nextPage = function () {
                                      if ($scope.currentPage < $scope.pagedItems.length - 1) {
                                          $scope.currentPage++;
                                      }
                                  };

                                  $scope.setPage = function () {
                                      $scope.currentPage = this.n;
                                  };

                                  // functions have been describe process the data for display
                                  $scope.search();
                      // end inserted script
    }

});


app.$inject = ['$scope', '$filter'];

app.directive("customSort", function() {
return {
    restrict: 'A',
    transclude: true,
    scope: {
      order: '=',
      sort: '='
    },
    template :
      ' <a ng-click="sort_by(order)" style="color: #555555;">'+
      '    <span ng-transclude></span>'+
      '    <i ng-class="selectedCls(order)"></i>'+
      '</a>',
    link: function(scope) {

    // change sorting order
    scope.sort_by = function(newSortingOrder) {
        var sort = scope.sort;

        if (sort.sortingOrder == newSortingOrder){
            sort.reverse = !sort.reverse;
        }

        sort.sortingOrder = newSortingOrder;
    };



    scope.selectedCls = function(column) {
        if(column == scope.sort.sortingOrder){
            return ('glyphicon glyphicon-chevron-' + ((scope.sort.reverse) ? 'down' : 'up'));
        }
        else{
            return'glyphicon glyphicon-sort'
        }
    };
  }// end link
}


});


