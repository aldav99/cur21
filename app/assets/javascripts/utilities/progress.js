
document.addEventListener('turbolinks:load', function() {

  var control = document.querySelector('.progress-bar')


  if (control) { control.addEventListener('click', move) }
})



function move() {

  var elem = document.querySelector('.my-bar')

  var totalCount = this.dataset.totalCount
  var currentNumber = this.dataset.currentNumber

  if( typeof move.progress == 'undefined' ) {
        move.progress = 0
    }

  move.progress += (currentNumber/totalCount) * 100
  
  step = move.progress

  elem.style.width = step + '%'

  return step

}
