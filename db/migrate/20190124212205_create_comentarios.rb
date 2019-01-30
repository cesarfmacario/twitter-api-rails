class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.references :tweet, foreign_key: true
      t.text :comentario
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
