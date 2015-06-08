class AddPaypalFormsToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :paypal_form_html, :string
  end
end
