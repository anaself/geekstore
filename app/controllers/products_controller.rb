# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :float
#  quantity   :float
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :list, :search]
  before_action :authenticate_user!, except: :list

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end

  # GET /products/1/edit
  def edit
  end

  def list
    @products = Product.paginate(:page => params[:page], per_page: 15)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to action: 'list', notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def search
    @products = Product.where('name Like ? ', "%#{params[:search]}%")
    render :list_search, layout: nil
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if params[:images]
          params[:images].each { |image|
          @product.images.create(photo: image)
        }
        end
        format.html { redirect_to action: 'list', notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def export_to_csv
    @products = Product.in_basket(current_user.basket)
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    if !params[:id].nil?
      @product = Product.find(params[:id])
    end

    @categories = Category.all

    if user_signed_in?
      @basket = current_user.basket
      @total_price = @basket.total_price
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price, :color, :photo, category_ids: [])
  end
end
