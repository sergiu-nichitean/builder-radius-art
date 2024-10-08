require "application_system_test_case"

class ContractModulesTest < ApplicationSystemTestCase
  setup do
    @contract_module = contract_modules(:one)
  end

  test "visiting the index" do
    visit contract_modules_url
    assert_selector "h1", text: "Contract modules"
  end

  test "should create contract module" do
    visit contract_modules_url
    click_on "New contract module"

    fill_in "Contract", with: @contract_module.contract_id
    fill_in "Settings", with: @contract_module.settings
    fill_in "Type", with: @contract_module.type
    click_on "Create Contract module"

    assert_text "Contract module was successfully created"
    click_on "Back"
  end

  test "should update Contract module" do
    visit contract_module_url(@contract_module)
    click_on "Edit this contract module", match: :first

    fill_in "Contract", with: @contract_module.contract_id
    fill_in "Settings", with: @contract_module.settings
    fill_in "Type", with: @contract_module.type
    click_on "Update Contract module"

    assert_text "Contract module was successfully updated"
    click_on "Back"
  end

  test "should destroy Contract module" do
    visit contract_module_url(@contract_module)
    click_on "Destroy this contract module", match: :first

    assert_text "Contract module was successfully destroyed"
  end
end
