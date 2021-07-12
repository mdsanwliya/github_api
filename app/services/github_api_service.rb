class GithubApiService
  BASE_URL = "https://api.github.com"

  attr_accessor :user
  
  def initialize(user)
    @user = user
  end

  def escape(s)
    CGI.escape(s.to_s)
  end

  def user_repositories
    "#{BASE_URL}/users/#{user.name}/repos"
  end

  def most_popular(params)
    if params["language"].eql?('ruby')
      "#{BASE_URL}/search/repositories?sort=stars&order=desc&q=created>#{params['date']}&per_page=10&q=language:ruby"
    else
      "#{BASE_URL}/search/repositories?sort=stars&order=desc&q=created>#{params['date']}&per_page=10"
    end
  end

  def execute(params={})
    if params.empty?
      JSON.parse(call(user_repositories))
    else
      JSON.parse(call(most_popular(params)))["items"]
    end
  end

  def call(url)
    uri = URI(url)
    resp = Net::HTTP.get_response(uri)
    resp.body
  end
end
