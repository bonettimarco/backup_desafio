class AddTotalAoDocumento < ActiveRecord::Migration
  def change
    add_column :documentos, :total, :float, :default => 0
  end
end
