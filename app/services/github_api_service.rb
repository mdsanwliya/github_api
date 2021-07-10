class GithubApiService
  BASE_URL = "https://api.github.com"

  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def escape(s)
    CGI.escape(s.to_s)
  end

  def build_query(params)
    base_filter= "?sort=stars&order=desc#{
    params.map { |k, v|
      v.nil? ? escape(k) : "#{escape(k)}=#{escape(v)}"
    }.join('&')}"
  end

  def user_repository
    "#{BASE_URL}/users/#{user.name}/repos"
  end

  def execute(type=nil)
    JSON.parse(call(user_repository,))
  end

  def call(url, payload={})
    uri = URI(url)
    resp = Net::HTTP.get_response(uri)
    resp.body
  end
end

