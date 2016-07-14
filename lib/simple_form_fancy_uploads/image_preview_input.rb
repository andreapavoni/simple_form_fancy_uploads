module SimpleFormFancyUploads
  class ImagePreviewInput < SimpleForm::Inputs::FileInput
    def input(wrapper_options=nil)
      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

      url = preview_url(merged_input_options)

      out = ''
      out << template.image_tag(url) if url
      out << @builder.input("#{attribute_name}_cache", as: 'hidden')
      (out << super).html_safe
    end

    private

    def preview_url(merged_input_options)
      use_default_url = options.delete(:use_default_url) || false
      version = merged_input_options.delete(:preview_version)

      if merged_input_options[:preview_url]
        merged_input_options[:preview_url]
      elsif object && object.send("#{attribute_name}?") || use_default_url
        object.send(attribute_name).tap {|o| break o.send(version) if version}.send('url')
      end
    end
  end
end
