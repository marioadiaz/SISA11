module OrdenFumigacionsHelper

    def cadenatovector(cadena)
        if cadena == nil
      return [""]
        else
            cadena = cadena.gsub "[", ""
            cadena = cadena.gsub "]", ""
            cadena = cadena.gsub '"', ""
            cadena = cadena.gsub "'", ""
            cadena = cadena.gsub " ", ""
            return cadena.split(",")
        end
    end

    def cadenatovecsinesp(cadena)
        if cadena == nil
      return [""]
        else
            cadena = cadena.gsub "[", ""
            cadena = cadena.gsub "]", ""
            cadena = cadena.gsub '"', ""
            cadena = cadena.gsub "'", ""
            
            return cadena.split(",")
        end
    end

    def cadenatohash(cadena)
        hash_post = Hash.new
        OrdenTrabajo::POST.each do |clave, valor|
            if cadenatovector(cadena).include? valor
                hash_post[clave] = valor
            end
        end
        return hash_post
    end

    def options_for_select(container, selected = nil)
        return container if String === container

        selected, disabled = extract_selected_and_disabled(selected).map do |r|
          Array(r).map(&:to_s)
        end

        container.map do |element|
          html_attributes = option_html_attributes(element)
          text, value = option_text_and_value(element).map(&:to_s)

          html_attributes[:selected] ||= option_value_selected?(value, selected)
          html_attributes[:disabled] ||= disabled && option_value_selected?(value, disabled)
          html_attributes[:value] = value

          tag_builder.content_tag_string(:option, text, html_attributes)
        end.join("\n").html_safe
    end

    def añobisiesto(año)
      if (año/4 == 0 and (año /100 != 0 || año /400 == 0))
        return true
      else return false
      end  
    end
    
    def diasxmes(mes)
      nmes=31
      
      if OrdenFumigacion::MESES30.include?(mes)
          nmes = 30
      end
      
      if mes == 2 
        if añobisiesto(fecha.year)
          nmes = 29
        else
          nmes = 28
        end 
      end
       return nmes
    end
    
    def sumarfechadias(fecharesult, dias)
      
      puts "fecharesult----------+: " + fecharesult.to_s + " diasxmes(fecharesult.month): " + diasxmes(fecharesult.month).to_s + " dias: " + dias.to_s
      while dias >= 30

        if fecharesult.day + 30 <= diasxmes(fecharesult.month)
          cadena = (fecharesult.day + 30).to_s + "/" + fecharesult.month.to_s + "/" + fecharesult.year.to_s
          puts "1-cadena: " + cadena + " fecharesult.month: " + fecharesult.month.to_s
        else
          if fecharesult.month != 12
            cadena = (fecharesult.day + 30 - diasxmes(fecharesult.month)).to_s + "/" + (fecharesult.month+1).to_s + "/" +fecharesult.year.to_s
            puts "2-cadena: " + diasxmes(fecharesult.month).to_s + " cadena: " + cadena + " fecharesult.month: ", fecharesult.month.to_s
          else
            cadena = (fecharesult.day + 30 - diasxmes(fecharesult.month)).to_s + "/" + "1" + "/" + (fecharesult.year+1).to_s
            puts "3-cadena: ",cadena
          end  
        end
        dias = dias - 30
        fecharesult = cadena.to_date
        puts "ciclofecharesult: " + fecharesult.to_s + " dias---: " + dias.to_s
      end

      return I18n.l(fecharesult, locale: :es, format: :default)
    end

end
