// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require popper
//= require_tree

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


    $("#buscador_clientes").keyup(function(event){
    let termino = $(this).val();
    let id_venta = $(this).data("venta");
    var x;
    if(termino.length == 0) {
      $("#tabla_buscador_clientes tbody").empty();
    }
    else {
      let request_url = getRootUrl() + "/buscador_clientes/" + termino;
      console.log("request_url:",request_url);

      $.get(request_url, function(data, status){
        if(data.length > 0){
          $("#tabla_buscador_clientes tbody").empty();
          
          for(x in data){
            let nombre = data[x].nombre_cliente;
            let id_cliente = data[x].id;
            let rowContent = `
               <tr>
                 <td>${nombre}</td>
                 <td>
                     <button 
                       class = "btn btn-primary"
                       onclick="seleccionarCliente(${id_cliente})"
                       >
                         Agregar
                     </button>
                 </td>
               </tr>
            `;
            $("#tabla_buscador_clientes tbody").append(rowContent);
          }
        }
      });
    }
  });


});

function getRootUrl() {
  return window.location.origin;
}
