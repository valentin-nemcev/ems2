$(document).ready ->
  $(".grid_switch :checkbox").change ->
    $('.container').toggleClass('grid-bg', ($(this).is(':checked')))
