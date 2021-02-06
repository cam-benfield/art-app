class CreateSmithsonianOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :smithsonian_owners do |t|
      t.string :abbrev
      t.string :name

      t.timestamps
    end
  end
end
