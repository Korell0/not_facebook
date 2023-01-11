app.controller('hirfolyamCtrl', function($scope, DB, $rootScope){
    $scope.hirek = [];
    $scope.users = [];
    $scope.comments = [];

    DB.selectAll('posts').then(function(res){
        $scope.hirek = res.data;
        DB.selectAll('users').then(function(res){
            $scope.users = res.data;
            $scope.hirek.forEach(hir => {
                let idx = $scope.users.findIndex(item => item.ID === hir.userID);
                if(idx > -1){
                    hir = Object.assign(hir,{username:$scope.users[idx].name, usermail:$scope.users[idx].email})
                }
            });
            console.log($scope.hirek)
        })
        DB.selectAll('comments').then(function(res){
            $scope.comments = res.data;
            $scope.hirek.forEach(hir => {
                $scope.comments.forEach(comment =>{

                })
            })
        })
    })
    
    $scope.upload = function(){
        
        let data = {
            userID: $rootScope.loggedUser.ID,
            date: moment(new Date()).format('YYYY-MM-DD'),
            postmessage: $scope.szoveg
        }
        DB.insert('posts', data)
        window.location.reload();
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