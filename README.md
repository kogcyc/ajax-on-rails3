How To Use AJAX Rails 3
==============

This is a minimal example of how to use AJAX via jQuery on Rails 3(.2.11).

####1) First off, here is the environment used for this example:

```bash
$ uname -a
Linux n5040 3.5.0-23-generic #35-Ubuntu SMP Thu Jan 24 13:05:29 UTC 2013 i686 i686 i686 GNU/Linux
$ ruby -v
ruby 1.9.3p385 (2013-02-06 revision 39114) [i686-linux]
$ rails -v
Rails 3.2.11
```

####2) Next, create an app and a controller

```bash
$ rails new ajaxexample

$ cd ajaxexample

$ rails g controller ajax
```

####3) ajax_controller.rb

Add a method named <i>example</i> to ajax_controller.rb

Note that this is a fairly standard Rails 3 controller method

When called without an extension it will render the file:

<i>example.html.erb</i>

When called with a .js extension (http://host/example.js), it will 'render':

<i>example.js.erb</i>

And that's the first secret to how AJAX works: an AJAX call will add .js<br>
to the name of the controller and the controller will then respond_to the<br>
format.js by rendering <i>example.js.erb</i>

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

####4) example.html.erb

The next trick is this: all you have to do to create an AJAX call is to add
<i><b>:remote => true</b></i> to any form, link, button or other call to the controller

This page also contains a div that will be target of the AJAX callback 
which will be run once the controller finishes

```ruby
<div id='content'></div>

<%= link_to 'Go, Ajax, Go!', :action => 'example', :remote => true, :to_controller => 'Bazinga!' %> 
```

####6) routes.rb

Add this route:

```ruby
get "/example" => "ajax#example"
```
