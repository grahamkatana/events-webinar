class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :email
      t.string :contact_number
      t.string :customer_stripe_id

      t.timestamps
    end
  end
end
