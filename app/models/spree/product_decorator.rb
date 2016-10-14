Spree::Product.class_eval do
  scope :by_store, -> (store) { joins(:stores).where(spree_products_stores: { store_id: store }) }
end
