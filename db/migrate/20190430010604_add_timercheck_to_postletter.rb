class AddTimercheckToPostletter < ActiveRecord::Migration[5.0]
  def change
    add_column :postletters, :timercheck, :string
  end
end
