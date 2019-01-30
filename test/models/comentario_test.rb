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

require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
