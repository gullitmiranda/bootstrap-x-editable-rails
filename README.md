# X-editable 1.4.0 for Rails - Hacked Version

[X-editable](https://github.com/vitalets/x-editable) is an in-place editing plugin with support for Twitter Bootstrap, jQuery UI or pure jQuery.

The `bootstrap-x-editable-rails` gem integrates `X-editable` with Rails asset pipeline. This gem only supports the Bootstrap part of X-editable. The Hacked Version changes the AJAX request on update, to suit rails way.

For example, if you have a DOM ``<a href="#" id="content"><%= @album.content %></a>``, when update, AJAX request sends the updated value as: ``{"name"=>"content","value"=>"it's great"}`` (Note that value in 'name' is from DOM id)

However, in rails, we want to send a model object instead, eg. ``{"album"=> {"content"=>"it's great"}}``, so we can store data in rails as simple as: `` @album.update_attributes(@params[:album]) ``

In this version, DOM id is named as "model-column", eg. for an 'Album' model with 'Content' column =>  id="album-content". If not using this format, it will use original AJAX request format.

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

## Additional Support in Hacked Version

### View helper

This is use to simplify the html and jquery used in xeditable

Originally, to generate a editable view for model 'album' and column 'content', you need to do following:

    <a href="#" id="album-content" data-type="text" data-pk="1" data-url="<%= album_path(@album) %>" data-original-title="Enter content">@album.content</a>

    $(document).ready(function(){
    	$('#album-content').editable({
			ajaxOptions:{
				type: 'put',
				dataType: 'json'
			}
    	});
    });

This code provides a helper, ``xeditable(url, type, model, column, value, options = {})`` . By using the helper, all you have to do is:

	<%= xeditable(album_path(@album),'text', 'album', 'content', @album.content, {:original-title => 'Enter Content'}) %>

Note that, since there are many optional attributes in xeditable, additional types can be used in putting in option hash, eg. original-title as above. 

## Updating the gem
There are two rake tasks designed to ease the maintenance of this gem.

The `update` task pulls the latest X-editable code from github and places images, stylesheets and javascripts in the correct gem paths. It also changes background-image properties in the stylesheet to asset pipeline equivalents.

	rake update
	
The `build` task is a simple wrapper for `gem build`
	
	rake build
