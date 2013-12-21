class RelationshipsController < ApplicationController
	before_filter :authenticate_sapien!
	
	def create
		@sapien = Sapien.find(params[:relationship][:inspirer_id])
		current_sapien.admire!(@sapien)
		respond_to do |format|
			format.html {redirect_to profile_path(@sapien.agnomen)}
			format.js
		end
	end

	def destroy
		@sapien = Relationship.find(params[:id]).inspirer
		current_sapien.disadmire!(@sapien)
		respond_to do |format|
			format.html {redirect_to profile_path(@inspirer.agnomen)}
			format.js
		end
	end
end
