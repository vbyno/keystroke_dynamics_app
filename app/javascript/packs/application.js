// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import '../stylesheets/application'
import './bootstrap_custom.js'
import $ from 'jquery';

$(document).ready(function(){
  let keystrokes = [];
  let $initialText = document.getElementById("input-text-example-text");
  let initialText = null;

  if (document.getElementById("input-text-example-text")) {
    initialText = $initialText.innerHTML.trim();
  };

  function highlight(text, target) {
    let index = initialText.indexOf(text);

    if (index >= 0) {
     $initialText.innerHTML =
      `${initialText.substring(0, index)}<span class='highlight'>${initialText.substring(index, index + text.length)}</span>${initialText.substring(index + text.length)}`;
      target.classList.remove("mistake")
    } else {
      target.classList.add("mistake")
    };
  }

  let $keystrokeSubmit = $('#keystroke-submit');

  $('#text').keydown(function (e) {
      keystrokes.push(`${$.now()} KeyDown ${e.keyCode}`);
    }).keyup(function (e) {
      keystrokes.push(`${$.now()} KeyUp ${e.keyCode}`);
      let text = e.target.value;
      highlight(text, e.target);
      $keystrokeSubmit.prop('disabled', !(text == initialText));
    }).bind("cut copy paste",function(e) {
      e.preventDefault();
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
