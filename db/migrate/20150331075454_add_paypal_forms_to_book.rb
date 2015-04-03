class AddPaypalFormsToBook < ActiveRecord::Migration
  def change
    add_column :books, :paypal_form_html, :string
  end
end
