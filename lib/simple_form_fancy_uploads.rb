require 'simple_form'
require 'simple_form_fancy_uploads/attachment_preview_input'
require 'simple_form_fancy_uploads/image_preview_input'

module SimpleFormFancyUploads
end

SimpleForm::Inputs.send(:include, SimpleFormFancyUploads)
