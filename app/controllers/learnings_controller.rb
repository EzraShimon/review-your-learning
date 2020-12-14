class LearningsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_learning, only: [:show, :edit, :update, :destroy]

  # GET /users/1/learnings
  # GET /users/1/learnings.json
  def index
    @learnings = @user.learnings
  end

  # GET /learnings/1
  # GET /learnings/1.json
  def show
  end

  # GET /users/1/learnings/new
  def new
    @learning = @user.learnings.build
  end

  # GET /learnings/1/edit
  def edit
  end

  # POST /users/1/learnings
  # POST /users/1/learnings.json
  def create
    @learning = @user.learnings.build(learning_params)

    respond_to do |format|
      if @learning.save
        format.html { redirect_to @learning, notice: 'Learning was successfully created.' }
        format.json { render :show, status: :created, location: @learning }
      else
        format.html { render :new }
        format.json { render json: @learning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learnings/1
  # PATCH/PUT /learnings/1.json
  def update
    respond_to do |format|
      if @learning.update(learning_params)
        format.html { redirect_to @learning, notice: 'Learning was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning }
      else
        format.html { render :edit }
        format.json { render json: @learning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learnings/1
  # DELETE /learnings/1.json
  def destroy
    @learning.destroy
    respond_to do |format|
      format.html { redirect_to user_learnings_url(@learning.user), notice: 'Learning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_learning
      @learning = Learning.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learning_params
      params.require(:learning).permit(:user_id, :description)
    end
end
