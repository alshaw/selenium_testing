require 'rails_helper'
require 'pry'

feature "Bank Accounts Edit", js: true do
  login_js
  before(:each) do
    @account = FactoryGirl.create(:bank_account, user: @user)
    visit edit_bank_account_path(@account.id)
  end

  scenario "Shows current institution on top" do
    expect(page).to have_content(@account.institution)
  end

  scenario "Renders form" do
    expect(page).to have_selector('.all-accounts', count: 1)
  end

  scenario "Link to all accounts is on page" do
    expect(page).to have_selector('.all-accounts', count: 1)
  end

  scenario "Updates record" do
    fill_in('Description', :with => 'Savings')
    click_button('Update Bank Account')
    @account.reload
    expect(@user.bank_accounts.first.description).to eq('Savings')
  end
end