Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'admin_product_form_stores',
  insert_bottom: "[data-hook='admin_product_form_fields']",
  partial: "spree/admin/products/stores"
)
