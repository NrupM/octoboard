class AddUserAttributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job_status, :integer
    add_column :users, :linkedin_url, :string
    add_column :users, :github_url, :string
    add_column :users, :portfolio_url, :string
    add_column :users, :other_url, :string
    add_column :users, :other_url_name, :string
    add_column :users, :image, :string
    add_column :users, :octopower, :integer
  end
end
