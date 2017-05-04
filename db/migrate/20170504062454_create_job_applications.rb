class CreateJobApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :job_applications do |t|
      t.date :date_applied
      t.integer :stage
      t.string :company_name
      t.string :location
      t.string :job_post_url
      t.text :job_description
      t.text :job_requirements
      t.string :job_title
      t.integer :application_method
      t.text :why_interested
      t.string :requested_salary
      t.text :submitted_cover_letter
      t.text :relevant_work_history
      t.string :tech_stack
      t.text :notes
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
