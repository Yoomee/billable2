class RecordedTimesController < ApplicationController
  before_action :set_recorded_time, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /recorded_times
  # GET /recorded_times.json
  def index
    @recorded_times = RecordedTime.all
  end

  # GET /recorded_times/1
  # GET /recorded_times/1.json
  def show
  end

  # GET /recorded_times/new
  def new
    @recorded_time = RecordedTime.new
    @todo_list_item = TodoListItem.find(params[:todo_list_item_id])
  end

  # GET /recorded_times/1/edit
  def edit
  end

  # POST /recorded_times
  # POST /recorded_times.json
  def create
    @recorded_time = RecordedTime.new(recorded_time_params)

    respond_to do |format|
      if @recorded_time.save
        format.html { redirect_to @recorded_time, notice: 'Recorded time was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recorded_time }
      else
        format.html { render action: 'new' }
        format.json { render json: @recorded_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recorded_times/1
  # PATCH/PUT /recorded_times/1.json
  def update
    respond_to do |format|
      if @recorded_time.update(recorded_time_params)
        format.html { redirect_to @recorded_time, notice: 'Recorded time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recorded_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recorded_times/1
  # DELETE /recorded_times/1.json
  def destroy
    @recorded_time.destroy
    respond_to do |format|
      format.html { redirect_to recorded_times_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recorded_time
      @recorded_time = RecordedTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recorded_time_params
      params.require(:recorded_time).permit(:todo_list_item_id, :user_id, :hours)
    end
end