class Document < ActiveRecord::Base
  mount_uploader :fax, FaxUploader
end
