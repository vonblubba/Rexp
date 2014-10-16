require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase
  setup do
    @expense1 = expenses(:one)
    @expense2 = expenses(:two)
    @empty_desc = expenses(:empty_desc)
    @invalid_amount = expenses(:invalid_amount)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense" do
    assert_difference('Expense.count') do
      post :create, expense: { amount: @expense1.amount, date: @expense1.date, description: @expense1.description }
    end

    assert_redirected_to expense_path(assigns(:expense))
  end

  test "should show expense" do
    get :show, id: @expense1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expense1
    assert_response :success
  end

  test "should update expense" do
    patch :update, id: @expense1, expense: { amount: @expense1.amount, date: @expense1.date, description: @expense1.description }
    assert_redirected_to expense_path(assigns(:expense))
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete :destroy, id: @expense1
    end

    assert_redirected_to expenses_path
  end
  
  test "should reject empty expense" do
    assert @empty_desc.invalid?, @empty_desc.errors.full_messages.inspect
    assert_no_difference('Expense.count') do
      post :create, expense: { amount: @empty_desc.amount, date: @empty_desc.date, description: @empty_desc.description }
      #assert_redirected_to expense_path(:controller => "expense", :action => "new") pippo
    end
  end
  
  test "should reject invalid amount expense" do
    assert @invalid_amount.invalid?, @invalid_amount.errors.full_messages.inspect
  end
end
