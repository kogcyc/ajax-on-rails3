How To Use AJAX Inside Rails 3
==============

This is a minimal example of how to use AJAX on Rails 3(.2.11) with the help of jQuery

####0) No Setup Required

Note that Rails 3.2.11 comes with jQuery installed and configured: just start using it

####1) Environment

Here is the environment used for this example:

```bash
$ uname -a
Linux n5040 3.5.0-23-generic #35-Ubuntu SMP Thu Jan 24 13:05:29 UTC 2013 i686 i686 i686 GNU/Linux
$ ruby -v
ruby 1.9.3p385 (2013-02-06 revision 39114) [i686-linux]
$ rails -v
Rails 3.2.11
```

####2) To start, create an app and a controller

```bash
$ rails new ajaxexample

$ cd ajaxexample

$ rails g controller ajax
```

####3) ajax_controller.rb

Add a method named <b>example</b> to ajax_controller.rb:

```ruby
class AjaxController < ApplicationController

	def example

	    @from_controller = params[:to_controller]

	    respond_to do |format|
	      format.html
	      format.js
	    end

	end

end
```

Note that this is a fairly standard Rails 3 controller method

The <b>respond_to</b> block has two paths: <b>html</b> and <b>js</b>:

	HTML 
	
	When you browse <b><host>/example</b>, it renders the matching HTML file:
	
		example.html.erb

.

	JS 
	
	When you call into the example method using AJAX, it will use the matching JS file:
	
		example.js.erb 
	
	as the AJAX callback

That's largely how it works

So let's look at those two files...

####4) example.html.erb

Rails makes calling AJAX easy: all you have to do to create an AJAX call is to add
<b>:remote => true</b> to any form, link, button or other call to the controller

This file also contains a div with the id <b>content</b< that will be target of the AJAX callback 
which will be run once the controller finishes

Notice too that this link_to includes a parameter called <b>:to_controller</b><br>
- any parameters not named with a reserved word will end up in the params hash at the controller<br>
- this is standard Rails stuff and standard jQuery/AJAX stuff as well<br>

```ruby
<div id='content'></div>

<%= link_to 'Go, Ajax, Go!', :action => 'example', :remote => true, :to_controller => 'Bazinga!' %> 
```

####5) example.js.erb

This is the callback

Rails does nothing special here and it offers no helpers

The only help that Rails offers here is to expose 

You have to do it all yourself

But it follows the jQuery pattern and ERB pattern so you will likely<br>
have no trouble understanding how to use it

```ruby
$('#content').html("<%= escape_javascript( @from_controller) %>");
```

####6) routes.rb

Add this route:

```ruby
get "/example" => "ajax#example"
```

####7) Finally

That's all there is to it

Start the server locally:

```bash
rails s
```

And then browse:

    localhost:3000/example

Hope this helps
