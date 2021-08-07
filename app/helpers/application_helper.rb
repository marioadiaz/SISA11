module ApplicationHelper

	
	    def procesarelemento(elemento)
    	vectorelemento = elemento.split(" ")
    	resultado = ""
    	vectorelemento.each do |valor|
    		resultado = resultado + " %" + valor
    	end
    	return resultado
    end
end
