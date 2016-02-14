class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true

  def to_param
    [id,title.parameterize].join("-")
 end
end
