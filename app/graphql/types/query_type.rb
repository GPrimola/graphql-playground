Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allLinks, function: Resolvers::LinkSearch.new

  field :allUsers, !types[Types::UserType] do
    resolve -> (obj, args, ctx) { User.all }
  end

  field :allVotes, !types[Types::VoteType] do
    resolve -> (obj, args, ctx) { Vote.all }
  end
end
