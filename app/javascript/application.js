// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

import 'bootstrap'
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap

import Rails from '@rails/ujs';
Rails.start();

import 'bootstrap-datepicker'

(function ($) {
  $(document).ready(function () {
    console.log('System Ready');

    $(".input-group.date").datepicker({
      todayHighlight: true,
      format: 'dd/mm/yyyy',
      language: 'pt-BR',
    });

    $(".custom-carousel .prev").click(function () {
      const itemWidth = $('.custom-carousel-item:first').width()
      $('.custom-carousel ul').animate({ scrollLeft: $('.custom-carousel ul').scrollLeft() - (itemWidth * 1.2) }, 600);
    });

    $(".custom-carousel .next").click(async function () {
      const itemWidth = $('.custom-carousel-item:first').width()
      $('.custom-carousel ul').animate({ scrollLeft: $('.custom-carousel ul').scrollLeft() + (itemWidth * 1.2) }, 600);
    });
  });
})(jQuery);
