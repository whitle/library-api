# frozen_string_literal: true

module Api
  module V1
    module Books
      class BooksController < ApiController
        before_action :init_access_token
        before_action :init_user

        def not_assigned_books
          if @user
            render json: Book.where.not(id: @user.assigned_books.pluck(:book_id)), status: :ok
          else
            render json: {}, status: :unauthorized
          end
        end

        def assign_book
          @book = Book.find_by(id: params[:book_id])
          if @user && can_book_be_assigbed?
            @user.assigned_books.create(book: @book)
            render json: {}, status: :ok
          else
            render json: {}, status: :internal_server_error
          end
        end

        private

        def can_book_be_assigbed?
          @book && @user.assigned_books.where(book: @book).blank?
        end

        def init_user
          @user = User.find_by(access_token: @access_token) if @access_token
        end
      end
    end
  end
end
