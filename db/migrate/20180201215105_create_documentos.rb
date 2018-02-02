class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.attachment :file
      t.timestamps null: false
    end
  end
end
