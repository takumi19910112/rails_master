class AddImpressionsCountToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :impressions_count, :integer, default: 0
  end
end
