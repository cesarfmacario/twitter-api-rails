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

class UsuarioSesion < ApplicationRecord
  belongs_to :usuario
end
