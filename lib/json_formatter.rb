class ClickJsonFormatter
  include ActiveResource::Formats::JsonFormat

  attr_reader :username

  def initialize()
    abort(self.inspect)
  end

  # def decode(json)
  #   remove_root(ActiveSupport::JSON.decode(json))
  # end

  private
  
  # def username
  #   shorty = Shorty.find_by(identifier: self.attributes[:identifier])
  #   self.attributes[:username] = shorty.dispersal.disseminator.profile.name
  # end

  # def remove_root(data)
  #   if data.is_a?(Hash) && data[collection_name]
  #     data[collection_name]
  #   else
  #     data
  #   end
  # end
end