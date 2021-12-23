module Mutations
  class UpdateBook < BaseMutation
    argument :id, ID, required: true
    argument :input, Types::Inputs::BookInputType, required: true

    type Types::Custom::BookType

    def resolve(params)
      book = Book.find(params[:id])
      book.update!(book_params(params))
      book
    end

    private

    def book_params(params)
      params[:input].arguments.keyword_arguments
    end
  end
end
