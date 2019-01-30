# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  usuario_id :integer
#  texto      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ApplicationRecord
  belongs_to :usuario

  validates_presence_of :texto

end
