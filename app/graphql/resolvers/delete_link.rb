class Resolvers::DeleteLink < GraphQL::Function
  type Types::LinkType

  argument :linkID, !types.Int

  def call(_obj, args, _ctx)
    Link.destroy(args[:linkID])

  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new(e.message)
  end
end
