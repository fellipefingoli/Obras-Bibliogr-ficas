class AuthorsController < ApplicationController
  def index
  end
  
  def create_bulk
    @authors = []
    params[:authors].map do |author|
      @authors << Author.create!(parse_author_name(author[:name]))
    end
  
    render status: :created, json: @authors
  rescue ActiveRecord::RecordInvalid => e
    render status: :unprocessable_entity, json: e.record.errors
  rescue StandardError => e
    render status: :internal_server_error, json: "Cound't create authors"
  end

  private
    def parse_author_name(name)
      first_name, last_name = name.split(" ", 2)
      { first_name: first_name, last_name: last_name}
    end
end