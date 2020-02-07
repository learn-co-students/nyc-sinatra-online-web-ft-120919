class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name
      t.integer :figure_title_id
    end
  end
end
