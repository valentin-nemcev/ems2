$(document).ready ->
  $(".grid-switch :checkbox").change ->
    $('.container.root').toggleClass('grid-bg', ($(this).is(':checked')))
  .change()
