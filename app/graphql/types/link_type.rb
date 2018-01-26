Types::LinkType = GraphQL::ObjectType.define do
  name 'Link'

  field :id, !types.ID
  field :url, !types.String
  field :description, !types.String
  # declaring a field postedBy with type Types::UserType and that remaps to the
  # model field :user
  field :postedBy, -> { Types::UserType }, property: :user
end
