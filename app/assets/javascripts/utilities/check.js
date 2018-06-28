document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password) { password.addEventListener('input', check) }
  if (password_confirmation) { password_confirmation.addEventListener('input', check) }
})


function check() {
  var pass = document.getElementById('user_password').value
  var confirm_password = document.getElementById('user_password_confirmation').value

  if (confirm_password.length == 0) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Подтвердите пароль';
  } else if (pass == confirm_password) {
      document.getElementById('message').style.color = 'green';
      document.getElementById('message').innerHTML = 'matching';
  } else {
      document.getElementById('message').style.color = 'red';
      document.getElementById('message').innerHTML = 'not matching';
  }
}

