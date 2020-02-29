// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../stylesheets/application'
import './bootstrap_custom.js'
import $ from 'jquery';

$(document).ready(function(){
  let keystrokes = [];
  let inputTextExample = null;

  if (document.getElementById("input-text-example-text")) {
    inputTextExample = document.getElementById("input-text-example-text").innerHTML.trim();
  };

  let $keystrokeSubmit = $('#keystroke-submit');

  $('#text').keydown(function (e) {
      keystrokes.push(`${$.now()} KeyDown ${e.keyCode}`);
    }).keyup(function (e) {
      keystrokes.push(`${$.now()} KeyUp ${e.keyCode}`);
      $keystrokeSubmit.prop('disabled', !(e.target.value == inputTextExample));
    });

  $('#keystroke_session_form').submit(function(e) {
    $('#keystrokes').val(keystrokes.join(";"));
    $keystrokeSubmit.prop('disabled', true);
  });
});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
