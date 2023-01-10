app.controller('profilCtrl', function($scope, DB, $rootScope, fileUpload){

    $scope.uploadFile = function(){
        let file = $scope.Profilfile.file;
        let filename = '';

        if (file != null) {
            let uploadurl = 'http://localhost:3000/fileUpload';

            fileUpload.uploadFileToUrl(file, uploadurl).then(function(res){
                filename = res.data.filename;
                DB.update('users',$rootScope.loggedUser.ID, filename).then(function(res){
                    if (res.data.affectedRows != 0) {
                        alert('A profil módosítva!');
                    } else {
                        alert('Váratlan hiba történt az adatbázis művelet során!');
                    }
                })
            })
        }
    }

    $scope.updateprofile = function(){

        
        let data = {
            name: $scope.newprofile.name,
            password: $scope.newprofile.pass1,
            email: $scope.newprofile.email,
            phone: $scope.newprofile.phone,
            address: $scope.newprofile.address,
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