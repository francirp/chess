// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

$(document).ready(function() {
  $('.square').draggable({
    containment: '#board',
    revert: true,
    helper: 'clone',
    opacity: 0.7,
    revertDuration: 0
  });
  $('.square').droppable({
    drop: function(event, ui) {
      $(this).html(ui.draggable.html());
      $(ui.draggable).html('');
      $.ajax({
        url: '/moves',
        type: 'POST',
        data: {
            'move[game_id]': $('#board').attr('data-game_id'),
            'move[from]': $(ui.draggable).attr('id'),
            'move[to]': this.id
        },
        dataType: 'json'
      });
    }
  });
  
  $('.square').on('click', function() {
    $.ajax({
      url: 'http://localhost:3000/pages/board?square=' + this.id
    });
  });
});