class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :signupData, Types::AuthProviderInputData
  end

  argument :name, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      name: args[:name],
      email: args[:authProvider][:signupData][:email],
      password: args[:authProvider][:signupData][:password]
    )
  end
end

