class Resolvers::CreateUser < GraphQL::Function
  argument :name, !types.String
  argument :signupData, -> { !Types::AuthProviderInputData }

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      name: args[:name],
      email: args[:signupData][:email],
      password: args[:signupData][:password]
    )

  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(e.record.errors.full_messages)
  end
end

