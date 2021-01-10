class ExpensesController < ApplicationController
  # before_action :set_expense, only: [:show, :update, :destroy]
  # skip_before_action :authorized
  before_action :set_account

  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def show
    @expense = Expense.find(params[:id])
    render json: @expense
  end

  # POST /expenses
  def create
  @expense = @account.expenses.new(expense_params)

  @expense.date = DateTime.now
  if @account.update_balance(@expense) != 'Balance too low.'
    @expense.save
    render json: @account
  else
    render json: {error: 'Balance too low'}
  end
end

  # DELETE /expenses/1
  def destroy
    @expense = Expense.find(params[:id])
    @account = Account.find(@expense.account_id)
    if @account.update_balance_on_delete(@expense)
      @expense.destroy
      render json: @account
    else
      render json: {error: 'Balance too low'}
    end
  end


  private

  def set_account
    @account = Account.find(params[:account_id])
  end

    # Use callbacks to share common setup or constraints between actions.
    # def set_expense
    #   @expense = Expense.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def expense_params
      params.require(:expense).permit(:name, :account_id, :charge, :kind)
    end
end
