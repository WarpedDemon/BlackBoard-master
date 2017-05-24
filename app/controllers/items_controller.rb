class ItemsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      @item.save_attachments(item_params) if params[:item][:document_data]
        render :show, status: :created, location: @item
    else
        render json: @item.errors, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:name, :description , :image_base, :document_data => []) #change :picture to :image_base
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to item_path
  end

end
