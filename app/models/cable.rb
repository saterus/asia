class Cable < ActiveRecord::Base
  belongs_to :sender, :class_name => "Agent"

  attr_accessible :content, :sender_id, :title
end
