// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("jquery")

import "../stylesheets/application.scss";

$(document).on('click', '.filter-button', function() {
  $.ajax({
    type: "GET",
    url: "/",
    data: {
      date: $('.filter-date').val(),
      language: $('.filter-language').val()
    }
  });
});

$(document).on('click', '.filter-language', function() {
  if($(this).is(':checked'))
    $(this).val('ruby');
  else
    $(this).val('');
});