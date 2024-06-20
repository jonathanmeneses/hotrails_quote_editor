class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: [:edit, :update, :destroy]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if(@line_item_date.save)
      redirect_to quote_path(@quote), notice: "Date saved successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def destroy

    @line_item_date.destroy

    redirect_to quote_path(@quote), notice: "Date deleted successfully."

  end

  def update
    if @line_item_date.update(line_item_date_params)
      redirect_to quote_path(@quote), notice: "Date updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end
end
