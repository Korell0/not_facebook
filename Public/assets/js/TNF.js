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
            templateUrl: 'views/fooldal.html',
            controller: 'fooldalCtrl'
        })
        .when('/reg', {
            templateUrl: 'views/registration.html',
            controller: 'userCtrl'
        })
        .when('/felhasznalok', {
            templateUrl: 'views/felhasznalok.html',
            controller: 'felhasznalokCtrl'
        })
        .when('/statisztika', {
            templateUrl: 'views/statisztika.html',
            controller: 'statisztikaCtrl'
        })
        .when('/hirfolyam', {
            templateUrl: 'views/hirfolyam.html',
            controller: 'hirfolyamCtrl'
        })
        .when('/profil', {
            templateUrl: 'views/profil.html',
            controller: 'profilCtrl'
        })
        .otherwise('/')
});