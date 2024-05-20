# frozen_string_literal: true

class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms, id: :uuid do |t|
      t.string :name, null: false, limit: 50
      t.string :invite_code, null: false, limit: 50
      t.references :owner, null: false, type: :uuid
      t.timestamps
    end
  end
end
