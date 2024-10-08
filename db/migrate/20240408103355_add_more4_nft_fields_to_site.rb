class AddMore4NftFieldsToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :about_page_enable, :boolean
    add_column :sites, :about_page_title, :string
    add_column :sites, :about_page_content, :text
    add_column :sites, :contact_page_enable, :boolean
    add_column :sites, :contact_email, :string
    add_column :sites, :contact_page_content, :text
    add_column :sites, :tokengating_enable, :boolean
    add_column :sites, :tokengating_title, :string
    add_column :sites, :tokengating_content, :text
  end
end
