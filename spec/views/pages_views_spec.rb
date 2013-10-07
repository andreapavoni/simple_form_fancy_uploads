require 'spec_helper'

def stub_file(filename)
  path = File.expand_path(File.join('spec/fixtures', filename))
  File.open(path)
end

describe "pages/new" do
  before(:each) do
    assign(:page, Page.new)
    render template: 'pages/new', handlers: [:erb]
  end

  it { should render_template(partial: '_form') }

  it "contains image upload field" do
    rendered.should have_selector 'input[type=file].image_preview#page_image'
  end

  it "contains attachment upload field" do
    rendered.should have_selector 'input[type=file].attachment_preview#page_attachment'
  end
end

describe "pages/edit" do
  before(:each) do
    assign(:page, Page.new(image: stub_file('rails.png'), attachment: stub_file('test.txt')))
    render template: 'pages/edit', handlers: [:erb]
  end

  it { should render_template(partial: '_form') }

  context "uploaded image" do
    it "contains image upload field" do
      rendered.should have_selector 'input[type=file].image_preview#page_image'
    end

    it "contains image preview" do
      rendered.should have_selector 'img[alt=Rails]'
    end

    it "should fallback to default_url if specified" do
      rendered.should have_selector 'img[alt="Fancy upload default url"]'
    end
  end # uploaded image

  context "uploaded attachment" do
    it "contains attachment upload field" do
      rendered.should have_selector 'input[type=file].attachment_preview#page_attachment'
    end

    it "contains attachment link" do
      rendered.should have_selector 'a', content: 'test.txt'
    end
  end # uploaded attachment

end

