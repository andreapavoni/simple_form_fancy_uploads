module SimpleFormFancyUploads
  class AttachmentPreviewInput < SimpleForm::Inputs::FileInput
    def input(wrapper_options=nil)
      out = ''
      if object.send("#{attribute_name}?")
        out << template.link_to(object.send(attribute_name).filename, object.send(attribute_name).url)
      end
      (out << super).html_safe
    end
  end
end
