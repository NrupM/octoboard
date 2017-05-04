class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :primary_contact_name
      t.string :primary_contact_title
      t.string :primary_contact_email
      t.string :primary_contact_phone
      t.integer :interview_type
      t.text :notes
      t.datetime :coding_challenge_due_date
      t.text :coding_challenge_prompt
      t.string :coding_challenge_url
      t.text :thankyou_letter
      t.text :questions_to_ask
      t.datetime :interview_date
      t.boolean :is_followup_needed
      t.boolean :is_challenge_completed
      t.belongs_to :job_application, foreign_key: true

      t.timestamps
    end
  end
end
