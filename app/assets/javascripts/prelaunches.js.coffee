$(document).ready ->

  if $('body').hasClass('prelaunches')
    setTimeout (->
      $(".beta-form").slideToggle(1200, "easeOutBounce")
    ), 2000

