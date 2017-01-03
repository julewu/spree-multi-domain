Spree::Admin::ProductsController.class_eval do
  update.before :set_stores

  private

  def set_stores
    if params[:product].key? :store_ids
      params[:product][:store_ids] = params[:product][:store_ids].split(',').map(&:to_i)
    end
  end
end
