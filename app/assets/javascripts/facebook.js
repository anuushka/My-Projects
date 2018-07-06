         
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '2131967527077787',
          cookie     : true,
          xfbml      : true,
          version    : 'v3.0'
        });
          
        //Get login status
        FB.AppEvents.logPageView();   
        FB.getLoginStatus(function(response) {
         // statusChangeCallback(response);
        });
         
      };
      
      //Connect to facebook
      (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));

      //Check Login state
      function checkLoginState() {
        console.log("===============================");
        FB.getLoginStatus(function(response) {
          statusChangeCallback(response);
        }, {scope: 'public_profile, email'});
      }

      function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
          // Logged into your app and Facebook.
          testAPI();
        } else {
          // The person is not logged into your app or we are unable to tell.
          console.log('Please log into this app.');
        }
      }

      function  loginSocialUser(user) {          
        $.ajax({
            type: "POST",
            url: "/session/social/login",
            data: {user:user},
            dataType: 'json',
            success: function(data) {
              console.log("------------------------->");
              console.log(data.status);
              if(data.status=="ok" && data.hasOwnProperty("url")){
               console.log(data.url);
               window.location.replace(data.url);
              }
              console.log("------------------------->");
            },
            error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr);
            }
          });
      }
      
      function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me?fields=name,id,email', function(response) {
          console.log('Successful login for: ' + response.name);
          console.log('Successful login for: ' + response.id);
          console.log('Successful login for: ' + response.email);
          var user = {
            name: response.name, 
            email: response.email,
            fb_id: response.id,
            user_type: 1
          }
          loginSocialUser(user);
        });
      }  


    //   $('#sign_out').click(function(e) {
    //     FB.getLoginStatus(function(response) {
    //         if (response.authResponse) {
    //             return FB.logout();
    //         }
    //     });
    //     return true;
    // });

    function my_fb_logout() {
      FB.logout(function (response) {
          // turn https://www.mywebsite.com/current_path?query_string=xyz#section1
          // into https://www.mywebsite.com
          var url_string = window.location.href;
          var base_url_len = url_string.length - window.location.pathname.length - window.location.search.length;
          var base_url = url_string.substr(0, base_url_len);
  
          // append /security_logout and redirect to your site's logout page
          var new_url = base_url + "/security_logout";
          window.location.href = login_session_index_path;
      });
      // this may not the best way to prevent bubbling of the event (navigating to # in the current page),
      // but will do fine in this case I believe 
      return false;
  }
  
  // function facebook_clicked() {
  // FB.login(function() {}, {scope: 'public_profile, email'})
  // }
