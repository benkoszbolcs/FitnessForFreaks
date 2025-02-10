;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
		'ui.router',
    'app.common',
		'app.form',
    'app.user'
	])

	// Application config
	.config([
    '$stateProvider', 
    '$urlRouterProvider', 
    function($stateProvider, $urlRouterProvider) {

      $stateProvider
      .state('root', {
        views: {
          '': {
            templateUrl: './html/root.html'
          },
          'header@root': {
            templateUrl: './html/header.html'
          },
          'footer@root': {
            templateUrl: './html/footer.html'
          },
          'modal@root': {
            templateUrl: './html/modal.html'
          }
        }
      })
			.state('home', {
				url: '/',
        parent: 'root',
				templateUrl: './html/home.html',
				controller: 'homeController'
			})
      .state('sports', {
				url: '/sports',
        parent: 'root',
				templateUrl: './html/sports.html'
			})
      .state('workoutplan', {
				url: '/workoutplan',
        parent: 'root',
				templateUrl: './html/workoutplan.html'
			})
      .state('meals', {
				url: '/meals',
        parent: 'root',
				templateUrl: './html/meals.html',
				//controller: 'mealController'
			})
      .state('aboutus', {
				url: '/aboutus',
        parent: 'root',
				templateUrl: './html/aboutus.html'
			})
      .state('forum', {
				url: '/forum',
        parent: 'root',
				templateUrl: './html/forum.html',
        controller: 'forumController'
			})
      .state('login', {
				url: '/login',
        parent: 'root',
				templateUrl: './html/login.html',
        controller: 'loginController'
			})
      .state('register', {
				url: '/register',
        parent: 'root',
				templateUrl: './html/register.html',
        controller: 'registerController'

			})
      .state('profile', {
				url: '/profile',
        parent: 'root',
				templateUrl: './html/profile.html',
        controller: "profileController"
			})
      .state('users', {
				url: '/users',
        parent: 'root',
				templateUrl: './html/users.html',
        controller: "usersController"
			})
      .state('cart', {
				url: '/cart',
        parent: 'root',
				templateUrl: './html/cart.html',
        controller: "cartController"
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

	// Application run
  .run([
    '$rootScope',
    '$timeout',
    'user',
    function($rootScope, $timeout, user) {

      // Initialize user
      user.init();

      // Initalize tooltips
      $rootScope.tooltipsInit = () => {
        $timeout(() => {
          let tooltips = document.querySelectorAll('[data-bs-toggle="tooltip"]');
          if (tooltips.length) {
            [...tooltips].map(e => new bootstrap.Tooltip(e));
          }
        }, 100);
      }
    }
  ])

  // Home controller
  .controller('homeController', [
    function() {
      console.log('Home controller...');
    }
  ])

  // Forum controller
  .controller('forumController', [
    '$scope',
    'http',
    function($scope, http) {
      let methods = {
        getMessages: () => {
          http.request('./php/getMessages.php')
          .then(response => {
            $scope.messages = response;
            $scope.$applyAsync();
          }).catch(e=>console.log(e));
        }
      }
      

      $scope.bekuld = () => {
        http.request({
          url: './php/addMessages.php',
          data: {
            felhid:1, 
            tapasztalat: $scope.message
          }
        })
        .then(response => {
          if (response.affectedRows) {
            methods.getMessages();
            $scope.message = null;
          }
        }).catch(e=>console.log(e));
      }


      methods.getMessages();
    }
  ])

  // Login controller
  .controller('loginController', [
    '$rootScope',
    '$scope',
    '$state',
    'user',
    'util',
    'http',
    function($rootScope, $scope, $state, user, util, http) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          // Set email address from local storige if exist
          $scope.model = {email: util.localStorage('get', 'email')};

          // Set focus
					user.focus();

          // Initialize tooltips
          $rootScope.tooltipsInit();
        }
      };

      // Set scope methods
      $scope.methods = {

        // Login
        login: () => {

          // Set request
          http.request({
            url: "./php/login.php",
            data: util.objFilterByKeys($scope.model, 'showPassword', false)
          })
          .then(response => {
            response.email = $scope.model.email;
            user.set(response);
            util.localStorage('set', 'email', response.email);
            $state.go('home');
          })
          .catch(e => {
            $scope.model.password = null;
            user.error(e);
          });
        }
      };

      // Initialize
      methods.init();
    }
  ])

  .controller('registerController', [
    '$rootScope',
    '$scope',
    '$state',
    'user',
    'util',
    'http',
    function($rootScope, $scope, $state, user, util, http) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          // Set email address from local storige if exist
          //$scope.model = {email: util.localStorage('get', 'email')};

          // Set focus
					user.focus();

          // Initialize tooltips
          $rootScope.tooltipsInit();
        }
      };

      // Set scope methods
      $scope.methods = {

        // Login
        register: () => {

          let data = util.objFilterByKeys($scope.model, 
                      'showPassword;passwordConfirm', false);
          data.szulev = data.szulev.toISOFormat();

          // Set request
          http.request({
            url: "./php/register.php",
            data: data
          })
          .then(response => {
            response.email = $scope.model.email;
            user.set(response);
            util.localStorage('set', 'email', response.email);
            $state.go('home');
          })
          .catch(e => {
            $scope.model.password = null;
            user.error(e);
          });
        }
      };

      // Initialize
      methods.init();
    }
  ])

  // Profile controller
  .controller('profileController', [
    '$rootScope',
    '$state',
    '$scope',
    function($rootScope, $state, $scope) {
      if (!$rootScope.user.id) {
        $state.go('home');
        return;
      }
      $scope.model = {};
    }
  ])

  // Users controller
  .controller('usersController', [
    '$rootScope',
    '$state',
    '$scope',
    'user',
    'http',
    function($rootScope, $state, $scope, user, http) {

      if ($rootScope.user.type !== 'A') {
        $state.go('home');
        return;
      }

      $scope.header = {
        id: "azon.",
        type: "típus",
        name: "név",
        born: "született",
        gender: "neme",
        country: "ország",
        phone: "telefon",
        city: "település",
        postcode: "irányítószám",
        address: "cím",
        email: "email",
        year: "év",
        profession: "szakma",
        class: "osztály",
        valid: "érvényes"
      };
      $scope.headerLength = Object.keys($scope.header).length;

      // Set request
      http.request("./php/users.php")
      .then(response => {
        $scope.data = response;
        $scope.$applyAsync();
      })
      .catch(e => user.error(e));
    }
  ])

  // Cart controller
  .controller('cartController', [
    '$rootScope',
    '$state',
    function($rootScope, $state) {
      if (!$rootScope.user.id) {
        $state.go('home');
        return;
      }
    }
  ])
	

})(window, angular);