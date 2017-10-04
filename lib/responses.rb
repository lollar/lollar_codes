module Responses
  NotImplemented = lambda do |env| 
    [501, {}, 'This resource is not yet implemented']
  end
end
