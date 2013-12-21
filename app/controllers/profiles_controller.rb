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
    search_string = params['search']
    @sapien_list = Sapien.where(["agnomen like ?", "%#{search_string}%"])
    logger.info(@search)
    logger.info("------------------------------------------------------------")
    if @sapien_list!=nil
      respond_to do |format|
        format.html
        format.json { render json: @sapien_admirers }
      end 
    else
      redirect_to :my_thoughts
    end
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @sapien_admirers }
    # end
  end
end
