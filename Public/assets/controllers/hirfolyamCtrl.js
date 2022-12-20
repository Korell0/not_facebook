app.controller('hirfolyamCtrl', function($scope, DB, $rootScope){
    $scope.hirek = [];
    $scope.kommentek = [];

    DB.selectAll('posts').then(function(res){
        $scope.hirek = res.data;
    })

    DB.selectAll('comments').then(function(res){
        $scope.kommentek = res.data;
        console.log($scope.kommentek)
    })
    

    $scope.upload = function(){
        let data = {
            userID: $rootScope.loggedUser.ID,
            date: moment(new Date()).format('YYYY-MM-DD'),
            postmessage: $scope.szoveg
        }
        DB.insert('posts', data)
    }

    $scope.comment = function(index){
        let data = {
            userID: $rootScope.loggedUser.ID,
            postID: index+1,
            date: moment(new Date()).format('YYYY-MM-DD'),
            comment: $scope.kommentka
        }
        DB.insert('comments', data)
    }
});