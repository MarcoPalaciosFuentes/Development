class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_filter :must_be_permisos, only: [:edit, :destroy]

  #busqueda de items
def index
  @items = Item.all
  if params[:search]
    @items = Item.search(params[:search]).order("created_at DESC")
  else
    @items = Item.all
  end
end 

def search
  @items = Item.all
  if params[:search]
    @items = Item.search(params[:search]).order("created_at DESC")
  else
    @items = Item.all
  end
end 


  # GET /items
  # GET /items.json
  #def index
   # @items = Item.all
  #end

  # GET /items/1
  # GET /items/1.json

#metodo 1
 # def show
  #  @review = Review.where(item_id: @item.id).order("created_at DESC")

   # if @item.reviews.blank?
   #   @avg_review = 0
   # else
      #@avg_review = @review.average(:rating).round(2)
   # end
    #@item.update_attribute(:promedio, @avg_review)
  #end

  def show
    review = Review.where(item_id: @item.id).order("created_at DESC")
    unless @item.reviews.present?
     @avg_review = 0
    else
     @avg_review = @reviews.average(:rating).present? ? @reviews.average(:rating).round(2) : 0
    end
    @item.update_attribute(:promedio, @avg_review)
  end

  # GET /items/new
  def new
    @item = current_user.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Destino fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Destino fue modificado exitosamente.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Destino fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def must_be_permisos
      unless current_user && current_user.permisos?
        redirect_to item_path, notice: "Solo los administradores pueden editar destinos"
      end
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:Place, :description, :region, :weather, :environment, :activities, :image, :direccion, :promedio)
    end
end
