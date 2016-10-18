Spree::Admin::ProductsController.class_eval do
  update.before :set_stores

  private

  def set_stores
    if params[:product][:store_ids].present?
      params[:product][:store_ids] = params[:product][:store_ids].split(',')
    end
  end
end
