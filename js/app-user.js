;(function(window, angular) {

	'use strict';

  // Application user module
  angular.module('app.user', [
    'app.common'
  ])

  // User factory
  .factory('user', [
    '$rootScope',
    '$state',
    '$timeout',
    'util',
    ($rootScope, $state, $timeout, util) => {

      // Set local methods
      let methods = {

        // Show message/confirm
        showMessage: (options) => {
          let messageDialog = document.querySelector('#messageDialog');
          if (messageDialog) {
            $rootScope.message = options;
            $rootScope.$applyAsync();
            if (options.isAudio) {
              let audioElement = messageDialog.querySelector('audio');
              if (audioElement) {
                audioElement.volume = 0.1;
                audioElement.play();
              }
            }
            (new bootstrap.Modal(messageDialog)).show();
          }
        }
      };

      // Set service
      let service = {

        // Initialize
        init: () => {

          // Set user default properties
          $rootScope.user = {
            felhid      : null, 
						felhNev     : null,
						jelszo      : null,
						nem         : null,
            email       : null
          };
        },

        // Set
        set: (data) => {
          Object.keys(data).forEach(k => $rootScope.user[k] = data[k]);
          $rootScope.$applyAsync();
        },

        // Reset
        reset: (filter=null) => {
          if (util.isString(filter)) filter = filter.split(',');
          if (!util.isArray(filter)) filter = [];
          Object.keys($rootScope.user).forEach(k => {
            if (!filter.includes(k)) $rootScope.user[k] = null;
          });
          $rootScope.$applyAsync();
        },

        // Clone
        clone: () => {
          let result = {};
          Object.keys($rootScope.user).forEach(k => {
            result = $rootScope.user[k];
          });
          return result;
        },

        // Focus
				focus: () => {
					$timeout(() => {
						let firstInvalidInput = document.querySelector(`form input.ng-invalid`),
								firstEmptyInput   = document.querySelector(`form input.ng-empty`);
						if 		  (firstInvalidInput) firstInvalidInput.focus();
						else if (firstEmptyInput)   firstEmptyInput.focus();
					}, 200);
				},

        // Error
        error: (msg) => {
          methods.showMessage({
            icon: "text-danger fa-solid fa-circle-exclamation",
            content: msg,
            isAudio: true,
            event: null
          });
        },
      };

      // Logout
      $rootScope.logout = () => {
        methods.showMessage({
          icon: "text-primary fa-solid fa-circle-question",
          content: "Biztosan kijelentkezik?",
          isAudio: true,
          event: "logoutConfirmed"
        });
      };

      // Logout confirmed
      $rootScope.logoutConfirmed = () => {
        service.reset('email');
        if (['profile','cart','users'].includes($state.current.name) ||
           ($state.current.name === 'users' && $rootScope.user.type !== 'A'))
          $state.go('home');
      };

      // Return service
      return service;
    }
  ]);

})(window, angular);