class ProfilesController < ApplicationController
  def show
  	@sapien = Sapien.find_by_agnomen(params[:id])
  	if @sapien
  		@thoughts = @sapien.thoughts.all
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
