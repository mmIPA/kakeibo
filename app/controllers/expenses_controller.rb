class ExpensesController < ApplicationController
  def index
    start_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month

    @monthly_total = Expense.where(date: start_date..end_date).sum(:payment)
    
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new(date: params[:date])
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to root_path, notice: '支出を登録しました！'
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :amount)
  end
end