Spree::Admin::ProductsController.class_eval do
  update.before :set_stores

  private

  def set_stores
    params[:product][:store_ids] = params[:product][:store_ids].split(',').map(&:to_i)
    if params[:product][:store_ids].present?
      params[:product][:store_ids].each do |store_id|
        @product.products_stores.new(store_id: store_id)
      end
      if @product.valid?
        @product.products_stores.reload
      else
        params[:product].delete :store_ids
      end
    end
  end
end
