$(document).ready ->

  if $('body').hasClass('home')
    $('.home').pageScroller navigation: '.left-nav', scrollOffset: 0, animationType: 'easeOutExpo'
