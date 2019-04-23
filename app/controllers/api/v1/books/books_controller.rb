# frozen_string_literal: true

module Api
  module V1
    module Books
      class BooksController < ApiController
        before_action :init_book
        before_action :init_access_token
        before_action :init_user
        before_action :init_assigned_books, only: :date_of_reading_book

        def not_assigned_books
          if @user
            render json: Book.where.not(id: @user.assigned_books_list), status: :ok
          else
            render json: {}, status: :unauthorized
          end
        end

        def assign_book
          if can_book_be_assigbed_to_user?
            @user.assigned_books.create(book: @book)
            render json: {}, status: :ok
          else
            render json: {}, status: :internal_server_error
          end
        end

        def assigned_books
          if @user
            render json: @user.assigned_books_list, status: :ok
          else
            render json: {}, status: :unauthorized
          end
        end

        def date_of_reading_book
          if @user
            @assigned_books.book_progresses
                           .find_or_create_by(date_of_reading: params[:date_of_reading]) do |book_progress|
              book_progress.pages_read = params[:pages_read]
            end

            render json: {}, status: :ok
          else
            render json: {}, status: :unauthorized
          end
        end

        def own_books
          if @user
            render json: @user.books, status: :ok
          else
            render json: {}, status: :unauthorized
          end
        end

        def add_book
          if @user
            @user.books.create(book_permit_params)
            render json: {}, status: :ok
          else
            render json: {}, status: :unauthorized
          end
        end

        private

        def init_book
          @book = Book.find_by(id: params[:book_id])
        end

        def init_user
          @user = User.find_by(access_token: @access_token) if @access_token
        end

        def can_book_be_assigbed_to_user?
          @user && @book && @user.assigned_books.where(book: @book).blank?
        end

        def own_user_book?
          @user.books.where(id: params[:book_id])
        end

        def init_assigned_books
          @assigned_books = if own_user_book? && can_book_be_assigbed_to_user?
                              @user.assigned_books.create(book: @book)
                            else
                              @user.assigned_books.find_by(book: @book)
                            end
        end

        def book_permit_params
          params.require(:book).permit(:title, :author, :pages)
        end
      end
    end
  end
end
