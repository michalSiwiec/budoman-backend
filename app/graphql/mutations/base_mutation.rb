module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def resolve(params)
      @params = params[:input].to_h
    end
  end
end
