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

    scope = scope.by_user_follows(current_user) if filter[:scope] == 'follows' && current_user
    socpe = scope.where(filter[:user_id]) if filter[:user_id]
    scope = filter_by_terms(scope) if filter[:terms]

    scope
  end

  private

  def filter_by_terms(scope)
    result = scope.by_terms(filter[:terms])

    posts_without_quotes = result.where(quoted_post_id: nil)
    posts_with_quotes = filter_post_that_match_with_quote(result)

    posts_without_quotes.or(posts_with_quotes).order(created_at: :desc)
  end

  def filter_post_that_match_with_quote(scope)
    posts_with_quotes = scope.where.not(quoted_post_id: nil)
    quotes_ids = posts_with_quotes.pluck(:quoted_post_id)

    Post.where(id: quotes_ids).by_terms(filter[:terms])
  end
end