class Resolvers::LinkSearch < GraphQL::Function
  type !types[Types::LinkType]

  LinkFilter = GraphQL::InputObjectType.define do
    name 'LinkFilter'

    argument :description_cont, types.String
    argument :url_cont, types.String
  end

  LinkPagination = GraphQL::InputObjectType.define do
    name 'LinkPagination'

    argument :page, types.Int
    argument :per_page, types.Int
  end

  argument :filter, LinkFilter
  argument :pagination, LinkPagination

  def call(_obj, args, _ctx)
    search_params = args[:filter].to_h
    page = args[:pagination][:page]
    per_page = args[:pagination][:per_page]

    Link.ransack(search_params).result.page(page).per(per_page)
  end
end