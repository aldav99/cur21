class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :gist_url
      t.string :user

      t.timestamps
    end
  end
end
