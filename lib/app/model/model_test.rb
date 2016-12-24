require 'json'
require_relative 'manager'

class ModelTest
  json = File.read(File.expand_path(
      File.join(__FILE__, '..', '..', '..', '..', '/database/TKS1.json')))
  data = JSON.parse(json)
  manager = Manager.new("HOSMEA")
  manager.add_group(data)
end