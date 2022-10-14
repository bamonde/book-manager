// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

import 'bootstrap'
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap

import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function () {
  console.log('System Ready');

  $(".custom-carousel .prev").click(function () {
    const itemWidth = $('.custom-carousel-item:first').width()
    $('.custom-carousel ul').animate({ scrollLeft: $('.custom-carousel ul').scrollLeft() - (itemWidth * 1.2) }, 600);
  });

  $(".custom-carousel .next").click(async function () {
    const itemWidth = $('.custom-carousel-item:first').width()
    $('.custom-carousel ul').animate({ scrollLeft: $('.custom-carousel ul').scrollLeft() + (itemWidth * 1.2) }, 600);
  });
});
