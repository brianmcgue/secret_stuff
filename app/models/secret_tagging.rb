class SecretTagging < ActiveRecord::Base
  attr_accessible :secret_id, :tag_id

  validates :secret, :tag, :presence => true

  belongs_to :secret
  belongs_to :tag
end
