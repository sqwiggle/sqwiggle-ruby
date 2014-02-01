# Ruby Client for the Sqwiggle API

![Build Status](https://api.travis-ci.org/sqwiggle/sqwiggle-ruby.png)

A Ruby wrapper for the Sqwiggle REST API.

## Installation

Add this line to your application's Gemfile:

    gem 'sqwiggle-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sqwiggle-ruby

## Configuration

Create an API Client at https://www.sqwiggle.com/company/clients

Once you have a token there are two ways of instantiating an instance of a client.

### Globally (not thread safe)
```ruby
Sqwiggle.token = 'your token here'
client = Sqwiggle.client
```
### Locally (thread safe)
```ruby
client = Sqwiggle.client('your token here')
```
Which is basically syntactic sugar for
```ruby
Sqwiggle::Api::Client.new('your token here')
```

## Usage

### Services

A service acts a bit like an ActiveRecord relation proxy

```ruby
#load the message service
messages = client.messages

#the service currently has the following methods
old_message = messages.find 42
new_message = messages.new(params)
all_messages = messages.all
```

#### Available Services
* messages
* invites
* conversations
* attachments
* organizations
* rooms
* users

### Resources
Resources are not dissimilar to an ActiveResource or an ActiveRecord object
```ruby
#with a persisted object
message = client.messages.find 42
message.update(text:'the message') #fails silently
message.update!(text:'the message') #raises a Sqwiggle::Api::Errors::BadRequestError

#creating a new object
message = client.messages.new
message.text = 'the new message'
message.save #fails silently
message.save! #raises an error
```

## TODO

 * Capistrano integration
 * Pagination
 * Rdoc (or similar)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
