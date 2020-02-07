class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :name
      t.integer :figure_title_id
    end
  end
end
