class RelationshipsController < ApplicationController
	before_filter :authenticate_sapien!
	
	def create
		sapien = Sapien.find(params[:relationship][:inspirer_id])
		current_sapien.admire!(sapien)
		redirect_to profile_path(sapien.agnomen)
	end

	def destroy
		inspirer = Relationship.find(params[:id]).inspirer
		current_sapien.disadmire!(inspirer)
		redirect_to profile_path(inspirer.agnomen)
	end
end
