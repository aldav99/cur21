document.addEventListener('turbolinks:load', function() {

  //var control = document.querySelector('.progress-bar')
  // var display = document.querySelector('#time')

  // console.log('display = ' + display)

  // if (display) { display.addEventListener('load', start) }
  var control = document.querySelector('.start-test')

  // if (control) { control.addEventListener('click', start) }
  
})

// function start() {
//   alert('PRIVET')
//     display = document.querySelector('#time')
//     console.log('display = ' + display)
//   alert(display)
// }

// function start() {
//     var fiveMinutes = 60 * 5,
//     startTimer(fiveMinutes, display);
// }


// function startTimer(duration, display) {
//     var timer = duration, minutes, seconds;
//     setInterval(function () {
//         minutes = parseInt(timer / 60, 10)
//         seconds = parseInt(timer % 60, 10);

//         minutes = minutes < 10 ? "0" + minutes : minutes;
//         seconds = seconds < 10 ? "0" + seconds : seconds;

//         display.textContent = minutes + ":" + seconds;

//         if (--timer < 0) {
//             timer = duration;
//         }
//     }, 1000);
// }
