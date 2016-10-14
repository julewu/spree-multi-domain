Spree::Admin::ProductsController.class_eval do
  update.before :set_stores

  def update
    store_ids = params[:product][:store_ids]
    if params[:product].key? :store_ids
      params[:product].delete :store_ids
      store_ids.split(',').each do |store_id|
        @object.products_stores.new(store_id: store_id)
      end
    end
    super
  end

  private

  def set_stores
    @product.store_ids = nil unless params[:product].key? :store_ids
  end
end
