class TodoListItemsController < ApplicationController
  before_action :set_todo_list_item, only: [:show, :edit, :update, :destroy]

  # GET /todo_list_items
  # GET /todo_list_items.json
  def index
    @todo_list_items = TodoListItem.all
  end

  # GET /todo_list_items/1
  # GET /todo_list_items/1.json
  def show
  end

  # GET /todo_list_items/new
  def new
    @todo_list_item = TodoListItem.new
  end

  # GET /todo_list_items/1/edit
  def edit
  end

  # POST /todo_list_items
  # POST /todo_list_items.json
  def create
    @todo_list_item = TodoListItem.new(todo_list_item_params)

    respond_to do |format|
      if @todo_list_item.save
        format.html { redirect_to @todo_list_item, notice: 'Todo list item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @todo_list_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_list_items/1
  # PATCH/PUT /todo_list_items/1.json
  def update
    respond_to do |format|
      if @todo_list_item.update(todo_list_item_params)
        format.html { redirect_to @todo_list_item, notice: 'Todo list item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_list_items/1
  # DELETE /todo_list_items/1.json
  def destroy
    @todo_list_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_list_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list_item
      @todo_list_item = TodoListItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_item_params
      params.require(:todo_list_item).permit(:name, :todo_list_id)
    end
end
