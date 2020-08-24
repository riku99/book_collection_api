class Api::V1::BooksController < ApplicationController
    include SessionsModule
    before_action :confirm_login
    before_action :correct_user?, only: [:destroy]

    def create
        book = current_user.books.new(books_params)
        if book.save
            render json: {}
        end
        
    end

    def index
        books = current_user.books
        render json: books
    end

    def show
        book = Book.find(params[:id])
        render json: {
            id: book.id,
            title: book.title,
            authors: book.authors,
            image: book.image,
            memo: book.memo,
            created_at: book.created_at.to_s(:datetime_jp)
        }
    end

    def destroy
        @book.destroy
        render json: {}
    end

    private

    def books_params
        params.require(:book).permit(:title, :authors, :image, :memo)
    end

    def correct_user?
        @book = current_user.books.find_by(id: params[:id])
        if @book.nil?
            render josn: {error: "ユーザーが正しくありません"}
            return
        end
        
    end
end
