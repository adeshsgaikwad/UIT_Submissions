class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.column(:survey_id, :int)
      t.column(:text, :string)

      t.timestamps()
    end
  end
end
