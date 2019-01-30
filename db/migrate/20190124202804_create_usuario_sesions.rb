class CreateUsuarioSesions < ActiveRecord::Migration[5.2]
  def change
    create_table :usuario_sesions do |t|
      t.references :usuario, foreign_key: true
      t.string :token
      t.datetime :ultima_conexion
      t.boolean :sesion_activa

      t.timestamps
    end
  end
end
