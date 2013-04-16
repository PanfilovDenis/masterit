module Inkwell
  class Engine < Rails::Engine
    config.post_table = :works
    config.user_table = :users
  end
end