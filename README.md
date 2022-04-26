# SimpleForm fancy uploads

A set of [simple_form](https://github.com/plataformatec/simple_form) (~> 4.1) custom inputs to get image previews or a link to
uploaded file.

This gem uses the simple_form ability to write your own form tags (check the [simple_form-bootstrap](https://github.com/rafaelfranca/simple_form-bootstrap) example). In 90% of cases, you need some kind of preview when it comes to uploaded files (avatar, images, docs, etc..), why should I write the same markup each time?

## What you get

There're only two new file inputs:

* `ImagePreview`: guess what? when you edit an entry that contains an uploaded image, it will be shown (how many times did you this in a CMS?)
* `AttachmentPreview`: this is a generic upload field, it will show a direct link to the file, so you can check *what* was uploaded.

## How it works

### Install

Simply add `gem 'simple_form_fancy_uploads'` to your `Gemfile` and run `bundle install`

### Usage

Here's a basic example, as you can see, it's just a matter of specify the input as `:image_preview` or `:attachment_preview`. If using `:image_preview`, you can also specify a `:preview_version => :some_version_name` inside the `:input_html` Hash. This will let you to show a custom version generated with Carrierwave. Nice, isn't it?

If you need to fallback on Carrierwave's `#default_url` method to show a default image defined in your upload class, set `:use_default_url => true` in the options hash.

```erb
<%= simple_form_for @some_model do |f| %>
  <!-- we specify that this is an image form upload input, and we want to show the 'thumb' version
  of the carrierwave upload to not break our layout with a non-resized image -->
  <%= f.input :some_image_field, as: :image_preview, input_html: {preview_version: :thumb} %>

  <!-- here's a *normal* attachment. with this input, a link to the filename will be shown
  if there's an uploaded file -->
  <%= f.input :some_attachment_field, as: :attachment_preview %>
<% end %>
```

If you want, you can pass the `preview_url` to the image on the input_html options. This might be useful when you don't have a model binded to the form.

```erb
<%= simple_form_for :user do |f| %>
  <%= f.input :image, as: :image_preview, input_html: { preview_url: image_url } %>
<% end %>
```

### Dependencies

To get it work, you need:

* [simple_form](https://github.com/plataformatec/simple_form) ~> 4.1 (*repetita iuvant*)
* [carrierwave](https://github.com/jnicklas/carrierwave) actually it's the most opinionated gem for uploads (thank you paperclip for the good times, but you know... life goes on)
* ruby 2.2.2+

### Testing

* clone this repo
* run `bundle install`
* run `rspec spec`

## Contributions & Bugs

* *the easy way:* go to [issues](issues/) page and blame me.
* *the hard way:* repeat the above points, then show your power and send a pull request.

## License
Copyright (c) 2014 Andrea Pavoni http://andreapavoni.com
