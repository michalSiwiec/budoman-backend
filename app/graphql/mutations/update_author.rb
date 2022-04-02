# frozen_string_literal: true

module Mutations
  class UpdateAuthor < BaseMutation
    argument :id, ID, required: true
    argument :input, Types::Inputs::AuthorInputType, required: true

    type Types::Custom::AuthorType

    def resolve(params)
      author = Author.find(params[:id])
      author.update!(author_params(params))
      author
    end

    private

    def author_params(params)
      params[:input].arguments.keyword_arguments
    end
  end
end
