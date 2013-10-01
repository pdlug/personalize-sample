# encoding: utf-8

class Alert
  include Mongoid::Document

  field :category, type: String
  field :label, type: String
end
