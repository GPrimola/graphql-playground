class Resolvers::EditLink < GraphQL::Function
  type Types::LinkType

  LinkParameters = GraphQL::InputObjectType.define do
    name 'LinkUpdateParameters'

    argument :description, types.String
    argument :url, types.String
  end

  argument :linkID, !types.Int
  argument :parameters, LinkParameters

  def call(_obj, args, _ctx)
    link = Link.find(args[:linkID])

    link.update!(args[:parameters].to_h)

    link
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(e.record.errors.full_messages)
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new(e.message)
  end
end
