class DescriptionAllowNil < ActiveRecord::Migration[5.1]
  def change
    remove_column :subs, :description
    add_column :subs, :description,:text
  end
end
