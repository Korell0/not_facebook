app.controller('felhasznalokCtrl', function($scope, DB, $rootScope){
$scope.felhasznalok = [];

DB.selectAll('users').then(function(res){
    $scope.felhasznalok = res.data;
})

})