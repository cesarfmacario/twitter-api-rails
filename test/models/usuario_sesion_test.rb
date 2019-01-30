# == Schema Information
#
# Table name: usuario_sesions
#
#  id              :integer          not null, primary key
#  usuario_id      :integer
#  token           :string
#  ultima_conexion :datetime
#  sesion_activa   :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UsuarioSesionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
