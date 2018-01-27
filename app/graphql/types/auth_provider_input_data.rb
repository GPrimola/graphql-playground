Types::AuthProviderInputData = GraphQL::InputObjectType.define do
  name 'UserSignInData'

  argument :email, !types.String
  argument :password, !types.String
end
