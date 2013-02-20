class AjaxController < ApplicationController

	def example

	    @from_controller = params[:to_controller]

	    respond_to do |format|
	      format.html
	      format.js
	    end

	end

end
