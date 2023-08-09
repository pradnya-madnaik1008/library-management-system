# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy checkout]

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  def checkout
    check_book_available = Checkout.find_by(book_id: params[:id])
    if check_book_available.present?
      student_info = Student.find_by(id: check_book_available.student_id)
      data = { checkout_info: check_book_available, book_info: @book, student_info: student_info }
      render json: { message: 'Book is checked out.', data: data }
    else
      render json: { message: 'Book is available for checkout.', data: @book }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:isbn, :title, :authors, :language, :edition, :subject, :library_id)
  end
end
