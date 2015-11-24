require "pry"
require "httparty"


module Githubber
	class Teams
		include HTTParty
		base_uri "https://api.github.com"

		def initialize(auth_token)
			@auth = {
				"Authorization" => "token #{auth_token}",
				"User-Agent" => "HTTParty"
			}
		end

		def create_issue()
			Teams.post("/repos/#{owner}/#{repo}/issues", headers: @auth, :body => {"title" => title,
			                                                                      "body" => body,
			                                                                      "assignment" => assignment }.to_json)
		end

		def teams_org(org)
			response = Teams.get("/orgs/#{org}/teams", headers: @auth)
			team_names = []
			response.each do |team| 
				team_names.push(team["name"])
			end
			team_names
		end

		def team_members(id)
			response = Teams.get("/teams/#{id}/members", headers: @auth)
			member_names =[]
			response.each {|key, value| puts "#{value} is a team member." }
				member_names.push(value["login"])
		end
			member_names

		def content(id)
			response = Teams.get("/gists/#{id}", headers: @auth)
		end
	end
	binding.pry
end



