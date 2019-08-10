require 'spec_helper'

def stub_file(filename)
  path = File.expand_path(File.join('spec/fixtures', filename))
  File.open(path)
end

describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new)
    render template: 'pages/new', handlers: [:erb]
  end

  it { should render_template(partial: '_form') }

  it "contains image upload field" do
    expect(rendered).to have_selector 'input[type=file].image_preview#page_image'
  end

  it "contains attachment upload field" do
    expect(rendered).to have_selector 'input[type=file].attachment_preview#page_attachment'
  end
end

describe "pages/edit", type: :view do
  before(:each) do
    assign(:page, Page.new(image: stub_file('rails.png'), attachment: stub_file('test.txt')))
    render template: 'pages/edit', handlers: [:erb]
  end

  it { should render_template(partial: '_form') }

  context "uploaded image" do
    it "contains image upload field" do
      expect(rendered).to have_selector 'input[type=file].image_preview#page_image'
    end

    it "contains image preview" do
      expect(rendered).to have_selector "img[src$='rails.png']"
    end

    it "should fallback to default_url if specified" do
      expect(rendered).to have_selector "img[src*='/assets/fancy-upload-default-url']"
    end
  end # uploaded image

  context "uploaded attachment" do
    it "contains attachment upload field" do
      expect(rendered).to have_selector 'input[type=file].attachment_preview#page_attachment'
    end

    it "contains attachment link" do
      expect(rendered).to have_selector 'a', text: 'test.txt'
    end
  end # uploaded attachment

end
