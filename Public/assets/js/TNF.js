let app = new angular.module('TNFApp', ['ngRoute']);

app.run(function($rootScope, $locale, DB) {

    $locale.NUMBER_FORMATS.GROUP_SEP = ".";
    $locale.NUMBER_FORMATS.DECIMAL_SEP = ",";

    $rootScope.settings = {};
    $rootScope.loggedUser = {};
    $rootScope.settings.appTitle = 'Totaly Not Facebook';
    $rootScope.settings.company = 'Bajai SZC Türr István Technikum';
    $rootScope.settings.author = 'Korlár';
    $rootScope.penznem = 'Ft';
    $rootScope.decimals = 0;
    $rootScope.exch = 1;
});

app.config(function($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: '/Public/assets/views/fooldal.html',
            controller: 'fooldalCtrl'
        })
        .when('/registration', {
            templateUrl: '/Public/assets/views/registration.html',
            controller: 'userCtrl'
        })
        .when('/felhasznalok', {
            templateUrl: '/Public/assets/views/felhasznalok.html',
            controller: 'felhasznalokCtrl'
        })
        .when('/statisztika', {
            templateUrl: '/Public/assets/views/statisztika.html',
            controller: 'statisztikaCtrl'
        })
        .when('/hirfolyam', {
            templateUrl: '/Public/assets/views/hirfolyam.html',
            controller: 'hirfolyamCtrl'
        })
        .when('/profil', {
            templateUrl: '/Public/assets/views/profil.html',
            controller: 'profilCtrl'
        })
        .when('/login', {
            templateUrl: 'Public/assets/views/login.html',
            controller: 'registrationCtrl'
        })
        .otherwise('/')
});