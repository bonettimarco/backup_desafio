class Documento < ActiveRecord::Base
    has_attached_file :file 

    validates_attachment :file, presence: true, content_type: { content_type: ["application/vnd.ms-excel", 
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "text/csv", "text/tab"] }
    validates_with AttachmentSizeValidator, attributes: :file, less_than: 10.megabytes
end

