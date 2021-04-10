class SearchController < ApplicationController
  def results
    @clientes = Cliente.buscador(params[:termino])
    @tecnicos = Tecnico.buscador(params[:termino])
  end
end