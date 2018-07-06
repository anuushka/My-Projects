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

function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  // console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
   var user = {
      name: profile.getName(), 
      email: profile.getEmail(),
      user_type: 2
    }
    loginSocialUser(user);
}

function signOut() {
  var auth2 = gapi.auth2.getAuthInstance();
  auth2.signOut().then(function () {
    console.log('User signed out.');
  });
}

//   var xhr = new XMLHttpRequest();
// xhr.open('POST', 'http://localhost:3000/session/google/login');
// xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
// xhr.onload = function() {
//   console.log('Signed in as: ' + xhr.responseText);
// };
// xhr.send('idtoken=' + id_token);