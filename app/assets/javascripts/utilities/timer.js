document.addEventListener('turbolinks:load', function() {

  var control = document.querySelector('.timer')
  if (control) { window.addEventListener('load', start(control)) }
})



function start(control) {

  time = control.dataset.time

  startTimer(time, control)
}

function startTimer(duration, display) {
  var timer = duration, minutes, seconds;
  setInterval(function () {
      minutes = parseInt(timer / 60, 10)
      seconds = parseInt(timer % 60, 10);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;

      display.textContent = minutes + ":" + seconds;

      if (--timer < 0) {
        url = window.location + '/result'
        window.location.replace(url);
      }
  }, 1000);
}