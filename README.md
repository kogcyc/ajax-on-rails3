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

####3) Add a method named <i><b> example </b></i> to /app/controllers/ajax_controller.rb

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


####6) routes.rb

Add this route:

```ruby
get "/example" => "ajax#example"
```
