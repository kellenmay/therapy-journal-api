class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index 
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @entries = @user.entries
    else
      @entries = Entry.all
    end 
    render json: @entries
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)
  
    if @entry.save
      render json: @entry, status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1  
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    render json: @entry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:title, :body, :emotion, :user_id, :journal_id)
    end
end
