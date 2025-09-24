module ClientesHelper

    def procesarelemento(elemento)
        vectorelemento = elemento.split(" ")
        resultado = nil
        vectorelemento.each do |valor|
            if resultado.nil?
                resultado = valor
            else
                resultado = resultado + "% %" + valor
            end
        end
        return resultado
    end

end
