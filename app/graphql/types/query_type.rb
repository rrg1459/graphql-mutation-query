# module Types
#   class QueryType < Types::BaseObject
#     # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
#     include GraphQL::Types::Relay::HasNodeField
#     include GraphQL::Types::Relay::HasNodesField

#     # Add root-level fields here.
#     # They will be entry points for queries on your schema.

#     # TODO: remove me
#     field :test_field, String, null: false,
#     description: "An example field added by the generator"
#     def test_field
#       "Hello World!"
#     end
#   end
# end
#######
module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false do
      description 'Find all authors'
    end

    field :author, Types::AuthorType, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    field :books, [Types::BookType], null: false do
      description 'Find all authors'
    end

    field :book, Types::BookType, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    def authors
      Author.all
    end

    def author(id:)
      Author.find(id)
    end

    def books
      Book.all
    end

    def book(id:)
      Book.find(id)
    end
  end
end