# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants, id: :uuid do |t|
      t.references :user, null: false, type: :uuid
      t.references :chatroom, null: false, type: :uuid
      t.timestamps
    end
  end
end
