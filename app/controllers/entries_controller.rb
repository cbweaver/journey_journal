class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy, :create_comment]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @journey = Journey.find(params[:journey_id])
    @owner = User.find(@entry.user_id)
  end

  # GET /entries/new
  def new
    @journey = Journey.find(params[:journey_id])
    @entry = @journey.entries.new
  end

  # GET /entries/1/edit
  def edit
    @journey = Journey.find(params[:journey_id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @journey = Journey.find(params[:journey_id])
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to journey_entry_path(@journey, @entry), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    @journey = Journey.find(params[:journey_id])

    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to journey_entry_path(@journey, @entry), notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @journey = Journey.find(params[:journey_id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to @journey, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body, :journey_id, :user_id, :latitude, :longitude, :parent_comment_id)
    end
end
