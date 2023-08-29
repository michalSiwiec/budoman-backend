# frozen_string_literal: true

class OrderPresenter
  def initialize(order)
    @order = order
  end

  def company_details
    [
      { field: 'Adres:', value: COMPANY_DETAILS.fetch(:address) },
      { field: 'Telefon:', value: COMPANY_DETAILS.fetch(:phone) },
      { field: 'Adres email:', value: COMPANY_DETAILS.fetch(:email) }
    ]
  end

  def invoice_details
    [
      { field: 'Numer faktury:', value: @order.id },
      { field: 'Data wystawienia', value: @order.created_at.strftime('%Y-%m-%d %H-%M-%S') }
    ]
  end

  def bill_to_details
    [
      { field: 'Nabywca:', value: "#{@order.name} #{@order.surname}" },
      { field: 'Telefon:', value: @order.phone_number },
      { field: 'Adres email:', value: @order.user.email }
    ]
  end

  def ship_to_details
    [
      { field: 'Miasto', value: @order.city },
      { field: 'Kod pocztowy:', value: @order.postal_code },
      { field: 'Ulica:', value: @order.street },
      { field: 'Numer mieszkania:', value: '22' }
    ]
  end

  def rows_names
    ['Nazwa produktu', 'Kategoria', 'Ilość', 'Cena']
  end

  def products_details
    @order.products_orders.map do |product_order|
      product = product_order.product

      {
        name: product.name,
        category_name: PRODUCT_CATEGORIES_NAMES.fetch(product.product_category.name.to_sym),
        quantity: product_order.product_quantity,
        price: product.price
      }
    end
  end

  def total_price
    @order.total_price
  end
end
