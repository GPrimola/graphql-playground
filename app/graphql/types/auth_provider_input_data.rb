Types::AuthProviderInputData = GraphQL::InputObjectType.define do
  name 'AUTH_PROVIDER_INPUT_DATA'

  argument :email, !types.String
  argument :password, !types.String
end
