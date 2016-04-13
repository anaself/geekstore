# == Schema Information
#
# Table name: baskets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy, :put, :basket_details, :cancel_product, :put_resume, :basket_modal, :reset_basket]

  # GET /baskets
  # GET /baskets.json
  def index
    @baskets = Basket.all
  end

  # GET /baskets/1
  # GET /baskets/1.json
  def show
    @products = Product.all
    @quantities = @basket.products_quantities

    render :show, layout: nil
  end

  def basket
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  def edit
  end

  def put
    @basket.put(params[:product_id], params[:product_quantity])
    respond_to do |format|
      format.html { redirect_to action: 'show', id: @basket.id }
    end
  end

  def basket_modal
    render :basket_modal, layout: nil
  end

  def put_resume
    @basket.put(params[:product_id], params[:product_quantity])
    @quantities = @basket.products_quantities
    render :basket_details, layout: nil
  end

  def basket_details
    @quantities = @basket.products_quantities
    render :basket_details, layout: nil
  end

  def reset_basket
    @basket.products.delete_all
    @basket.save
    render :basket_details, layout: nil
  end

  def cancel_product
    @basket.products.destroy(Product.find(params[:product_id]))

    respond_to do |format|
      if @basket.save
        format.html { redirect_to action: 'list', controller: 'products', notice: 'Product was successfully canceled' }
      else
        format.html { render :list }
      end
    end
  end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new(basket_params)

    respond_to do |format|
      if @basket.save
        format.html { redirect_to @basket, notice: 'Basket was successfully created.' }
        format.json { render :show, status: :created, location: @basket }
      else
        format.html { render :new }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baskets/1
  # PATCH/PUT /baskets/1.json
  def update
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to @basket, notice: 'Basket was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket }
      else
        format.html { render :edit }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_basket
    if !current_user.nil?
      @basket = current_user.basket
      @categories = Category.all
      @total_price = @basket.total_price
    else
      redirect_to '/users/sign_up'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def basket_params
    params.require(:basket).permit(:id, :quantity)
  end
end
