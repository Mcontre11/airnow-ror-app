class CreateAirNowData < ActiveRecord::Migration[7.0]
  def change
    create_table :air_now_data do |t|

      t.timestamps
    end
  end
end
