# frozen_string_literal: true

# == Schema Information
#
# Table name: denylists
#
#  id         :bigint           not null, primary key
#  exp        :datetime         not null
#  jti        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_denylists_on_jti  (jti) UNIQUE
#
class Denylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
end
