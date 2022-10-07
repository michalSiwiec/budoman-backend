class ProductQuery
  def initialize(params)
    @params = params
    @products = set_initial_products_scope
  end

  def call
    filter_by_type_if_needed
    @products
  end

  private

  def set_initial_products_scope
    return Product.promoted if @params[:promoted]

    Product.all
  end

  def filter_by_type_if_needed
    return unless @params[:type]

    @products = Product.from_type(@params[:type].underscore)
  end
end
