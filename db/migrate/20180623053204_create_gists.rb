class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.string :gist_url

      t.timestamps null: false
    end
  end
end
