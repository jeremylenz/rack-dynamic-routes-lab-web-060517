class Application
  def call(env)

    @@items

    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      requested_item = req.path.split("/items/").last
      found_item = Item.all.find { |item| item.name == requested_item }
      binding.pry
      if found_item != nil
        resp.write found_item.price
      else
        resp.write "Item not found"
        resp.status = "400"
      end
    else
      resp.write "Route not found"
      resp.status = "404"
    end
    resp.finish
  end


  def self.items
    @@items
  end

  def self.items=(items_list)
    @@items = items_list
  end

end
