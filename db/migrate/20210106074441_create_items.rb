class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user           , null: false, foreign_key: true
      t.string     :product        , null: false
      t.integer    :price          , null: false
      t.text       :explanation    , null: false 
      t.integer    :category_id    , null: false
      t.integer    :state_id       , null: false
      t.integer    :postage_id     , null: false
      t.integer    :area_id        , null: false
      t.integer    :wait_id        , null: false
      t.timestamps
    end
  end
end
