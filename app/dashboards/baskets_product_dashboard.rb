require "administrate/base_dashboard"

class BasketsProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    basket_id: Field::Number,
    product_id: Field::Number,
    quantity: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :basket_id,
    :product_id,
    :quantity,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :basket_id,
    :product_id,
    :quantity,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :basket_id,
    :product_id,
    :quantity,
  ]

  # Overwrite this method to customize how baskets products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(baskets_product)
  #   "BasketsProduct ##{baskets_product.id}"
  # end
end
