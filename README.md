# SimpleForm fancy uploads

A set of [simple_form](https://github.com/plataformatec/simple_form) (>= v2.0) custom inputs to get image previews or a link to
uploaded file.

This gem uses the new simple_form 2.0 ability to write your own form tags (check the [simple_form-bootstrap](https://github.com/rafaelfranca/simple_form-bootstrap) example). In 90% of cases, you need some kind of preview when it comes to uploaded files (avatar, images, docs, etc..), why should I write the same markup each time?

## What you get

There're only two new file inputs:

* `ImagePreview`: guess what? when you edit an entry that contains an uploaded image, it will be shown (how many times did you this in a CMS?)
* `AttachmentPreview`: this is a generic upload field, it will show a direct link to the file, so you can check *what* was uploaded.

## How it works

### Install

Simply add `gem 'simple_form_fancy_uploads'` to your `Gemfile` and run `bundle install`

### Usage

Here's a basic example, as you can see, it's just a matter of specify the input as `:image_preview` or `:attachment_preview`. If using `:image_preview`, you can also specify a `:preview_version => :some_version_name` inside the `:input_html` Hash. This will let you to show a custom version generated with Carrierwave. Nice, isn't it?
The default configuration of this gem is to not use `the default_url` method of carrierwave, if you want to show the default image defined in your upload class, you can use `:use_default_url => true` in the options hash.

```
<%= simple_form_for @some_model do |f| %>
  <!-- we specify that this is an image form upload input, and we want to show the 'thumb' version
  of the carrierwave upload to not break our layout with a non-resized image -->
  <%= f.input :some_image_field, as: :image_preview, input_html: {preview_version: :thumb} %>

  <!-- here's a *normal* attachment. with this input, a link to the filename will be shown
  if there's an uploaded file -->
  <%= f.input :some_attachment_field, as: :attachment_preview %>
<% end %>
```

### Dependencies

To get it work, you need:

* [simple_form](https://github.com/plataformatec/simple_form) >= v2.0 (*repetita iuvant*)
* [carrierwave](https://github.com/jnicklas/carrierwave) actually it's the most opinionated gem for uploads (thank you paperclip for the good times, but you know... life goes on)
* ruby 1.9+ (it uses some 1.9's syntax)

### Testing

* clone this repo
* run `bundle install`
* run `rspec spec`

## Contributions & Bugs

* *the easy way:* go to [issues](issues/) page and blame me.
* *the hard way:* repeat the above points, then show your power and send a pull request.

## License
Copyright (c) 2012 Andrea Pavoni http://andreapavoni.com
