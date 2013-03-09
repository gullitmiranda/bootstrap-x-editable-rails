# X-editable 1.4.0 for Rails - Hacked Version

[X-editable](https://github.com/vitalets/x-editable) is an in-place editing plugin with support for Twitter Bootstrap, jQuery UI or pure jQuery.

The `bootstrap-x-editable-rails` gem integrates `X-editable` with Rails asset pipeline. This gem only supports the Bootstrap part of X-editable. The Modified Version provides a hack to the original AJAX request on update, to suit the rails way .

For example, if you have a DOM ``<a href="#" id="content"><%= @album.content %></a>``, when update, AJAX request sends the updated value as below. (Note that value in 'name' is extracted from DOM id).
``{"name"=>"content","value"=>"it's great"}``

However, in rails, we want to send a model object instead, eg. ``{"album"=> {"content"=>"it's great"}}``, so we can store data in rails as: `` @album = update_attributes(@params[:album]) ``

In the new code, DOM id should be named as "model_column", eg. for an 'Album' model with 'Content' column =>  id="album_content". If not using this format, it will use original AJAX request format.

## Usage

### Install bootstrap-x-editable-rails gem

Include `bootstrap-x-editable-rails` in Gemfile

    gem 'bootstrap-x-editable-rails'

Then run `bundle install`

### Include X-editable javascript

Add to your `app/assets/javascripts/application.js`

#### Popup version

    //= require bootstrap-editable

#### Inline version

    //= require bootstrap-editable-inline

### Include X-editable stylesheet

Add to your `app/assets/stylesheets/application.css`

    *= require bootstrap-editable

## Updating the gem
There are two rake tasks designed to ease the maintenance of this gem.

The `update` task pulls the latest X-editable code from github and places images, stylesheets and javascripts in the correct gem paths. It also changes background-image properties in the stylesheet to asset pipeline equivalents.

	rake update
	
The `build` task is a simple wrapper for `gem build`
	
	rake build
