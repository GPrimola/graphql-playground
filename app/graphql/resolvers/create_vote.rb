class Resolvers::CreateVote < GraphQL::Function
  argument :linkID, !types.ID

  type Types::VoteType

  def call(_obj, args, ctx)
    Vote.create!(
      link: Link.find_by(id: args[:linkID]),
      user: ctx[:current_user]
    )
  end
end
