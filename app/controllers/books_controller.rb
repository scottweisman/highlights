require 'actionpack/action_caching'

class BooksController < ApplicationController
	caches_action :index, expires_in: 1.hour
	caches_action :show, expires_in: 1.hour

	def index
		@agent = Mechanize.new
	  @agent.user_agent_alias = 'Mac Safari'
	  @agent.get("https://kindle.amazon.com/")
	  if @agent.page.link_with(text: 'Guest')
		  @agent.page.link_with(text: "sign in").click
		  @form = @agent.page.forms.first
		  @form.email = session[:email]
		  @form.password = session[:password]
		  @form.submit
		end
	  @agent.page.link_with(text: "Your Books").click

		@results = @agent.page.search(".titleAndAuthor a")

		@books = []
		@results.each do |result|
			book = Hash.new
			book[:title] = result.content
			book[:asin] = result["href"].split("/").last
			@books << book
		end

		while @agent.page.link_with(text: "Next >")
			@agent.page.link_with(text: "Next >").click
			@results = @agent.page.search(".titleAndAuthor a")
			@results.each do |result|
				book = Hash.new
				book[:title] = result.content
				book[:asin] = result["href"].split("/").last
				@books << book
			end
		end

	end

	def show
		agent = Mechanize.new
	  agent.user_agent_alias = 'Mac Safari'
	  agent.get("https://kindle.amazon.com/your_highlights_and_notes/#{params[:asin]}")
	  form = agent.page.forms.first
	  form.email = session[:email]
	  form.password = session[:password]
	  form.submit

	  @title = agent.page.search(".title")
	  @author = agent.page.search(".author")
	  @highlights = agent.page.search(".highlight")
	end

	def test

	end
end
