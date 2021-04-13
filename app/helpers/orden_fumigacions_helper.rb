module OrdenFumigacionsHelper

	def validar
		if Cliente.find_by(nombre: "JARED1") && Tecnico.find_by(nombre: "JARED1")
			return true
			puts "return:truessssssssssssssssssssssssssssss"
		else
			return false
			puts "return:falsesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
		end	
	end	

end
