attr_accessible :description, :title, :logo, :delete_logo

#delete existing logo from edit view with checkbox.
attr_accessor :delete_logo
before_validation { logo.clear if delete_logo == '1' }
