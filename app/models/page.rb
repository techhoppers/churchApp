class Page < ActiveRecord::Base

  validates :title, :presence => true

 def enable!
    self.enabled
 end

 def disable!
    !self.enabled
 end

 def children
   Page.where(:parent_id => self.id)
 end

 def to_param
    [id,title.parameterize].join("-")
 end

 def dashboard
   self.title == "dashboard"
 end

 def has_child?
   !self.children.blank?
 end
end
