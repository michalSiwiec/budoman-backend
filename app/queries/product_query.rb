class ProductQuery
  def initialize(params)
    @params = params
    @products = set_initial_products_scope
  end

  def call
    @products
  end

  private

  def set_initial_products_scope
    return Product.promoted if @params[:promoted]

    Product.all
  end
end
