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

  $( "#BuscarCliente" ).click(function() {
    console.log( "<%= j render buscador_cliente %>" );

  });

  $("#buscador_clientes").keyup(function(event){
    let termino = $(this).val();

    if(termino.length == 0) {
      console.log("termino.length",termino.length);
      $("#tabla_buscador_clientes tbody").empty();
    }
    else {
      let request_url = getRootUrl() + "/buscador_clientes/" + termino;

      $.get(request_url, function(data, status){
        if(data.length > 0){
          $("#tabla_buscador_clientes tbody").empty();
          var x=0;
          for(x in data){
            let apellido = data[x].apellido;
            let id_cliente = data[x].id;
            console.log("apellido",apellido);
            console.log("id_cliente",id_cliente);
            let rowContent = `
               <tr>
                 <td>${apellido}</td>
                 <td>
                     <button id="miBotonC${id_cliente}"
                       class = "btn btn-primary"
                       onclick="${seleccionarCliente(`${id_cliente}`)}"
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

  $( "#BuscarTecnico" ).click(function() {
    console.log( "<%= j render buscador_tecnico %>" );


  });

  $("#buscador_tecnicos").keyup(function(event){
    let termino = $(this).val();

    if(termino.length == 0) {
      console.log("termino.length",termino.length);
      $("#tabla_buscador_tecnicos tbody").empty();
    }
    else {
      let request_url = getRootUrl() + "/buscador_tecnicos/" + termino;

      $.get(request_url, function(data, status){
        if(data.length > 0){
          $("#tabla_buscador_tecnicos tbody").empty();
          var x=0;
          for(x in data){
            let apellido = data[x].apellido;
            let id_tecnico = data[x].id;
            console.log("apellido",apellido);
            console.log("id_tecnico",id_tecnico);
            let rowContent = `
               <tr>
                 <td>${apellido}</td>
                 <td>
                     <button id="miBotonT${id_tecnico}"
                       class = "btn btn-primary"
                       onclick="${seleccionarTecnico(`${id_tecnico}`)}"
                       >
                         Agregar
                     </button>
                 </td>
               </tr>
            `;
            $("#tabla_buscador_tecnicos tbody").append(rowContent);
          }

        }
      });
    }

  });



});

function seleccionarCliente(id_cliente){

  let request_url = getRootUrl() + "/add_cliente_orden_fumigacion/";
  let info = { cliente_id: id_cliente };


  $.ajax({
      url: request_url,
      type: 'POST',
      data: JSON.stringify(info),
      contentType: 'application/json; charset=utf-8',
      success: function(result){
        var clickado = 0;
        if(result != null) {
          const boton = document.querySelector("#miBotonC"+id_cliente);

          boton.addEventListener("click", function(evento){
            // Aquí todo el código que se ejecuta cuando se da click al botón
            let apellido = result.apellido;
            $("#cliente_id_orden_fumigacion").html("Cliente: " + id_cliente);
            // cambia de color el boton
            $("#miBotonC"+id_cliente).removeClass('btn btn-primary');
            $("#miBotonC"+id_cliente).addClass('btn-success');

            clickado ++;

            if(clickado >= 1) {
              $("#buscador_cliente").modal("hide");
              $("#miBotonC"+id_cliente).removeClass('btn-success');
              $("#miBotonC"+id_cliente).addClass('btn btn-primary');

              $('body').removeClass('modal-open');
              $('.modal-backdrop').remove();

              console.log("SCclickado---",clickado);
            }
          });
        }
      }
  });
}

function seleccionarTecnico(id_tecnico){

  let request_url = getRootUrl() + "/add_tecnico_orden_fumigacion/";
  let info = { tecnico_id: id_tecnico };


  $.ajax({
      url: request_url,
      type: 'POST',
      data: JSON.stringify(info),
      contentType: 'application/json; charset=utf-8',
      success: function(result){
        var clickado = 0;
        if(result != null) {
          const boton = document.querySelector("#miBotonT"+id_tecnico);

          boton.addEventListener("click", function(evento){
            // Aquí todo el código que se ejecuta cuando se da click al botón
            let apellido = result.apellido;
            $("#tecnico_id_orden_fumigacion").html("tecnico: " + id_tecnico);
            // cambia de color el boton
            $("#miBotonT"+id_tecnico).removeClass('btn btn-primary');
            $("#miBotonT"+id_tecnico).addClass('btn-success');

            clickado ++;

            if(clickado >= 1) {
              $("#buscador_tecnico").modal("hide");
              $("#miBotonT"+id_tecnico).removeClass('btn-success');
              $("#miBotonT"+id_tecnico).addClass('btn btn-primary');

              $('body').removeClass('modal-open');
              $('.modal-backdrop').remove();

              console.log("SCclickado---",clickado);
            }
          });
        }
      }
  });
}

function getRootUrl() {
    return window.location.origin;
}
