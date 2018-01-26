class Resolvers::LinkSearch < GraphQL::Function
  type !types[Types::LinkType]

  LinkFilter = GraphQL::InputObjectType.define do
    name 'LinkFilter'

    argument :description_cont, types.String
    argument :url_cont, types.String
  end

  argument :filter, LinkFilter

  def call(obj, args, ctx)
    Link.ransack(args[:filter].to_h).result
  end
end
