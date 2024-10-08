require "test_helper"

class ContractModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_module = contract_modules(:one)
  end

  test "should get index" do
    get contract_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_module_url
    assert_response :success
  end

  test "should create contract_module" do
    assert_difference("ContractModule.count") do
      post contract_modules_url, params: { contract_module: { contract_id: @contract_module.contract_id, settings: @contract_module.settings, type: @contract_module.type } }
    end

    assert_redirected_to contract_module_url(ContractModule.last)
  end

  test "should show contract_module" do
    get contract_module_url(@contract_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_module_url(@contract_module)
    assert_response :success
  end

  test "should update contract_module" do
    patch contract_module_url(@contract_module), params: { contract_module: { contract_id: @contract_module.contract_id, settings: @contract_module.settings, type: @contract_module.type } }
    assert_redirected_to contract_module_url(@contract_module)
  end

  test "should destroy contract_module" do
    assert_difference("ContractModule.count", -1) do
      delete contract_module_url(@contract_module)
    end

    assert_redirected_to contract_modules_url
  end
end
