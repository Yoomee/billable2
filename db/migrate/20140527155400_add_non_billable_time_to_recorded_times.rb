class AddNonBillableTimeToRecordedTimes < ActiveRecord::Migration
  def change
    add_column :recorded_times, :non_billable_time, :interger
    add_column :recorded_times, :billable_time, :interger
  end
end