class PostsQueryResolverService
  attr_reader :filter, :current_user

  def initialize(filter, current_user)
    @filter = filter
    @current_user = current_user
  end

  def self.call(filter, current_user)
    new(filter, current_user).call
  end

  def call
    scope = Post.all

    if filter[:scope] == 'follows' && current_user
      scope = scope.by_user_follows(current_user)
    end

    if filter[:terms]
      scope = scope.by_terms(filter[:terms])
    end

    scope
  end
end