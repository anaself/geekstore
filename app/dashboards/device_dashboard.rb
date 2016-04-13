require "administrate/base_dashboard"

class DeviceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    mac_adress: Field::String,
    operating_system: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    model: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :mac_adress,
    :operating_system,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :mac_adress,
    :operating_system,
    :created_at,
    :updated_at,
    :model,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :mac_adress,
    :operating_system,
    :model,
  ]

  # Overwrite this method to customize how devices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(device)
  #   "Device ##{device.id}"
  # end
end
