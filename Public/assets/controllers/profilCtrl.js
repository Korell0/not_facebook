app.controller('profilCtrl', function($scope, DB, $rootScope){


    $scope.updateprofile = function(){
        let data = {
            name: $scope.newprofile.name,
            password: $scope.newprofile.pass1,
            email: $scope.newprofile.email
        }
        DB.update('users',$rootScope.loggedUser.ID, data).then(function(res){
            if (res.data.affectedRows != 0) {
                alert('A profil módosítva!');
            } else {
                alert('Váratlan hiba történt az adatbázis művelet során!');
            }
        })
    }
})