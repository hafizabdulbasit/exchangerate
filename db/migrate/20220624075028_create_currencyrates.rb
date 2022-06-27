class CreateCurrencyrates < ActiveRecord::Migration[6.1]
  def change
    create_table :currencyrates do |t|
      t.string :table
      t.string :currency
      t.string  :no
      t.string :code
      t.decimal :mid, precision: 9, scale: 5
      t.date :effective_date

      t.timestamps
    end
  end
end
