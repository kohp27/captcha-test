class InquiriesController < ApplicationController
  before_action :set_inquiry, only: %i[show edit update destroy]

  def index
    @inquiries = Inquiry.all
  end

  def show
  end

  def new
    @inquiry = Inquiry.new
  end

  def edit
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to @inquiry, notice: "Inquiry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @inquiry.update(inquiry_params)
      redirect_to @inquiry, notice: "Inquiry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @inquiry.destroy
    redirect_to inquiries_url, notice: "Inquiry was successfully destroyed."
  end

  private
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    def inquiry_params
      params.require(:inquiry).permit(:name, :content)
    end
end
