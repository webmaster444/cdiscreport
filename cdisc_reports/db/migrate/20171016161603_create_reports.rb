class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.date :date
      t.string :client
      t.string :notes
      t.string :count

      t.timestamps
    end
  end
end
