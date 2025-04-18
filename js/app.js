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
				templateUrl: './html/sports.html',
        controller: 'sportsController'
			})
      .state('workoutplan', {
				url: '/workoutplan',
        parent: 'root',
				templateUrl: './html/workoutplan.html',
        controller: 'workoutplanController'
			})
      .state('meals', {
				url: '/meals',
        parent: 'root',
				templateUrl: './html/meals.html',
        controller: 'mealsController'
				
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
    '$scope',
    function($scope) {
      $scope.states = [
        {
          
          title: 'Tekintsd meg a sport katalógusunkat, és válassz kedvedre a kínált sportok közül!',
          srcUrl: 'sports',
          srcText: 'Sportok',
          footerImg: './media/image/csapat2.jpg',
          footerText: 'Itt biztos megtalálod a neked való sportot és a hozzávaló alaptudást is elsajátíthatod!'
        },
        {
          title: 'Nem tudod mit egyél, ha fejlődni szeretnél? Szerencse, hogy itt megtalálod!',
          srcUrl: 'meals',
          srcText: 'Étrend',
          footerImg: './media/image/mate.jpg',
          footerText: 'Az egészséges táplálkozás legalább olyan fontos, mint maga az edzés!'
        },
        {
          title: 'Többet szeretnél megtudni, a csapatunkról? Nézz utána edzőidnek az alábbi oldalon, tudj meg rólunk többet!',
          srcUrl: 'aboutus',
          srcText: 'Rólunk',
          footerImg: './media/image/szabi1.jpg',
          footerText: 'Senki se szeretné, hogy hozzá nem értő, eredménytelen edzők tanítsák!'
        },
        {
          title: 'Oszd meg tapasztalataidat, kérdéseid más tagokkal!',
          srcUrl: 'forum',
          srcText: 'Fórum',
          footerImg: './media/image/balazs1.jpg',
          footerText: 'Beszélgessetek, kérdezzetek bátran, akár tagokat is el tudtok itt érni.'
        }
      ]
      console.log('Home controller...');
    }
  ])

  // Forum controller
  .controller('forumController', [
    '$rootScope',
    '$scope',
    'http',
    function($rootScope, $scope, http) {
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
            felhid: $rootScope.user.felhid, 
            tapasztalat: $scope.message
          }
        })
        .then(response => {
          if (response.affectedRows) {
            methods.getMessages();
            $scope.message = null;
          }
          // $scope.alert = function(arg){
          //   if ($rootScope.user.felhid == null){
          //     alert(arg);
          //   }
          // }
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
            $scope.model.jelszo = null;
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
  
      let methods = {
        init: () => {
          user.focus();
          $rootScope.tooltipsInit();
        }
      };
  
      $scope.methods = {
        register: () => {
          let data = util.objFilterByKeys($scope.model, 'showPassword;passwordConfirm', false);
          data.szulEv = moment(data.szulEv).format('YYYY-MM-DD');
  
          http.request({
            url: "./php/register.php",
            data: data
          })
          .then(userID => {
            user.set({
              felhid  : userID, 
              felhNev : data.felhNev,
              nem     : data.nem
            });
  

            util.localStorage('set', 'email', $scope.model.email);
  
            // Alert hozzáadása sikeres regisztráció esetén
  
            $state.go('home');
          })
          .catch(e => {
            $scope.model.jelszo = null;
            $scope.model.passwordConfirm = null;
            user.error(e);
          });
        }
      };
  
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
        $state.go('cart');
        return;
      }
    }
  ])

  .controller('sportsController', [
    '$scope',
    'http',
    '$state',
    'user',
    function($scope, http, $state, user) {

      http.request("./php/sports.php")
      .then(response => {
        $scope.data = response;
        $scope.$applyAsync();
      })
      .catch(e => user.error(e));

      $scope.bovebben = (sport) => {
        $scope.sport = sport;
        $scope.$applyAsync();
      }
    }
  ])

  .controller('workoutplanController', [
    '$scope',
    'http',
    '$state',
    'user',
    function($scope, http, $state, user) {

      // Get day of week
      $scope.currentDayIndex = moment().day() - 1;
      if ($scope.currentDayIndex < 0) {
        $scope.currentDayIndex = 6;
      }
      $scope.selectedTab = $scope.currentDayIndex;

      // Set rest day
      $scope.restDays = [1, 3, 6];

      http.request("./php/workoutplan.php")
      .then(response => {
        $scope.data = response;
        $scope.$applyAsync();
      })
      
      .catch(e => user.error(e));

      $scope.bovebben = (gyakorlat) => {
        $scope.gyakorlat = gyakorlat;
        $scope.$applyAsync();
      }

      http.request("./php/workoutplanData.php")
      .then(response => {
        $scope.data2 = response;
        $scope.$applyAsync();
      })
      
      .catch(e => user.error(e));
      
      $scope.bovebben = (gyakorlat2) => {
        $scope.gyakorlat2 = gyakorlat2;
        $scope.$applyAsync();
      }

      $scope.changeDay = (index) => {
        $scope.selectedTab = index;
      }
    }
  ])

  .controller('mealsController', [
    '$scope',
    'http',
    function($scope, http) {

      $scope.mealsType = "Reggelik";
      http.request("./php/meals.php")
      .then(response => {
        $scope.data = response;
        $scope.$applyAsync();
      })
      .catch(e => user.error(e));

      $scope.bovebben = (meal) => {
        meal.hozzavalok = meal.hozzavalok.split("\n");
        meal.hozzavalok.forEach((item, i) => {
          meal.hozzavalok[i] = item.substr(1);
        });
        $scope.meal = meal;

        $scope.$applyAsync();
      }

      $scope.mealChoice = (mealsType) => {
        $scope.mealsType = mealsType;
        $scope.$applyAsync();
      };

    }
  ])

})(window, angular);