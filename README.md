# VideoEmbed

Generate html to embed videos based on a url.

Currently supported services:

* YouTube
* Vimeo

## Installation

Add this line to your application's Gemfile:

    gem 'video_embed'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install video_embed

## Usage

Default settings:

    VideoEmbed.embed('http://www.youtube.com/watch?v=NtgtMQwr3Ko')
    => "<iframe source=\"...

Specify a width and height:

    VideoEmbed.embed('http://www.youtube.com/watch?v=NtgtMQwr3Ko',
      :width => 1280,
      :height => 720
    )
    => "<iframe source=\"...

## Development

Install the dependencies:

    bundle

Run the tests:

    bundle exec rspec .

## Development using Docker

### Setup

Install [Docker](https://docs.docker.com/install/).

Build a Docker image with all dependencies:

    make build

### Run the tests

    make test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
