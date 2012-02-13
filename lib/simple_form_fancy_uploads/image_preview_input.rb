module SimpleFormFancyUploads
  class ImagePreviewInput < SimpleForm::Inputs::FileInput
    def input
      version = input_html_options.delete(:preview_version)
      out = ''
      if object.send("#{attribute_name}?")
        out << template.image_tag(object.send(attribute_name).tap {|o| break o.send(version) if version}.send('url'))
      end
      (out << super).html_safe
    end
  end
end
