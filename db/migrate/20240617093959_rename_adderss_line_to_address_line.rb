class RenameAdderssLineToAddressLine < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :adderss_line, :address_line
  end
end
