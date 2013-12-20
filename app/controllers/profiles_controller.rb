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

  def inspirers
  	@sapien = current_sapien
  	respond_to do |format|
      format.html
      format.json { render json: @sapien_inspirers }
    end
  end

  def admirers
  	@sapien = current_sapien
  	respond_to do |format|
      format.html
      format.json { render json: @sapien_admirers }
    end
  end

  def search
    @search = params['search']
    logger.info(@search)
    @sapien_by_agnomen = Sapien.find_by_agnomen(@search)
    @sapien_by_email = Sapien.find_by_email(@search)
    @sapien = @sapien_by_agnomen || @sapien_by_email
    respond_to do |format|
      format.html
      format.json { render json: @sapien_admirers }
    end
  end
end
