// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

import 'bootstrap'
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap

$(document).ready(function () {
  console.log('Sytem Ready');
});
