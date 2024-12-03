class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    respond_to do |format|
      format.html # HTMLビュー
      format.json do
        render json: @expenses.group_by(&:date).map do |date, expenses|
          {
            title: "#{expenses.sum(&:payment)}円",
            start: date.to_s
          }
        end
      end
    end
  end

  
  def new
    @expense = Expense.new(date: params[:date])
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: '支出が保存されました。'
    else
      redirect_to expenses_path, alert: 'エラーが発生しました。'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :payment)
  end
end