module NotesHelper
	def registrospendientes
    	@notes = Note.where(estado: 'En proceso').count
    	
    	if @notes > 0
    		return true
    	else
    		return false
    	end
    	
    end
end
