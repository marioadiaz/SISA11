// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"

import "../stylesheets/application"
import "@fortawesome/fontawesome-free/js/all"


Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).on('turbolinks:load', function() {

  $("#clientes_search input").keyup(function() {
    $.get($("#clientes_search").attr("action"), $("#clientes_search").serialize(), null, "script");
    console.log("get",$.get($("#clientes_search").attr("action"), $("#clientes_search").serialize(), null, "script"));
    console.log("this(val): ", $(this).val());
    
    return false;
  });


});

