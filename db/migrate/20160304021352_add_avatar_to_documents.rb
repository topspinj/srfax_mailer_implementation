class AddAvatarToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :fax, :string
  end
end
