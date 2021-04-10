// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"

import "bootstrap"
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).on('turbolinks:load', function() {
  
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
                     <button id="miBoton${id_cliente}"
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
		        const boton = document.querySelector("#miBoton"+id_cliente);
				
				boton.addEventListener("click", function(evento){
					// Aquí todo el código que se ejecuta cuando se da click al botón
					let apellido = result.apellido;
		        	$("#cliente_ap_orden_fumigacion").html("Cliente: " + apellido);
		        	$("#cliente_id_orden_fumigacion").html("Cliente_id: " + id_cliente);

		        	$("#miBoton"+id_cliente).removeClass('btn btn-primary');
                	$("#miBoton"+id_cliente).addClass('btn-success');
					
		      		clickado ++;
		      		if(clickado >= 1) {
						$("#buscador_cliente").modal("hide");
				        $('body').removeClass('modal-open');
				        $('.modal-backdrop').remove();
				        $("#miBoton"+id_cliente).removeClass('btn-success');
                		$("#miBoton"+id_cliente).addClass('btn btn-primary');
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
