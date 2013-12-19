class ThoughtsController < ApplicationController
  before_filter :authenticate_sapien!, only: [:new, :create, :update, :edit]
  # GET /thoughts
  # GET /thoughts.json
  def index
    @thoughts = Thought.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thoughts }
    end
  end

  def my_thoughts
    @public_thoughts = current_sapien.thoughts.where(:private => false)
    @personal_thoughts = current_sapien.thoughts.where(:private => true)
    respond_to do |format|
      format.html # my_thoughts.html.erb
      format.json { render json: @thought }
    end
  end

  def others_thoughts
    @inspirers = current_sapien.inspirers
    respond_to do |format|
      format.html # my_thoughts.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
    @thought = Thought.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/new
  # GET /thoughts/new.json
  def new
    @thought = Thought.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/1/edit
  def edit
    @thought = current_sapien.thoughts.find(params[:id])
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    @thought = current_sapien.thoughts.new(params[:thought])

    respond_to do |format|
      if @thought.save
        format.html { redirect_to @thought, notice: 'Thought was successfully created.' }
        format.json { render json: @thought, status: :created, location: @thought }
      else
        format.html { render action: "new" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thoughts/1
  # PUT /thoughts/1.json
  def update
    @thought = current_sapien.thoughts.find(params[:id])
    
    if params[:thought] && params[:thought].has_key?(:sapien_id)
      params[:thought].delete(:sapien_id) 
    end

    respond_to do |format|
      if @thought.update_attributes(params[:thought])
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought = current_sapien.thoughts.find(params[:id])
    @thought.destroy

    respond_to do |format|
      format.html { redirect_to thoughts_url }
      format.json { head :no_content }
    end
  end
end
