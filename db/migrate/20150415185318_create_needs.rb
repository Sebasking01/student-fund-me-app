class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.title :string
      t.start_date :date
      t.end_date :date
      t.timestamps null: false
    end
  end
end
