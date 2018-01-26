class Resolvers::CreateLink < GraphQL::Function
  # passed as "args"
  argument :description, !types.String
  argument :url, !types.String

  # return type of the mutation
  type Types::LinkType

  def call(_obj, args, _ctx)
    Link.create!(
      description: args[:description],
      url: args[:url]
    )
  end
end
