# == Schema Information
#
# Table name: comentarios
#
#  id         :integer          not null, primary key
#  tweet_id   :integer
#  comentario :text
#  usuario_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comentario < ApplicationRecord
  belongs_to :tweet
  belongs_to :usuario
end
