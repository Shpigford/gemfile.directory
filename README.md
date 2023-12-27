# gemfile.directory

[gemfile.directory](https://gemfile.directory) is a directory of Ruby gemfiles that are used in your favorite Ruby and Rails projects!

Made by [@Shpigford](https://twitter.com/Shpigford) and [friends](https://github.com/Shpigford/gemfile.directory/graphs/contributors).

## Codebase

The codebase is vanilla [Rails](https://rubyonrails.org/), [Sidekiq](https://sidekiq.org/) w/ [Redis](https://redis.io/), [Puma](http://puma.io/), and [Postgres](https://www.postgresql.org/). Quite a simple setup.

## Setup

You'll need:

- ruby >3 (specific version is in `Gemfile`)
- postgresql (if using stock `config/database.yml`)
- GitHub API key (for login)

```shell
cd gemfile.directory
bundle install
rails db:setup
```

You can then run the rails web server:

```shell
bin/dev
```

And visit [http://localhost:3000](http://localhost:3000)

## Contributing

It's still very early days for this so your mileage will vary here and lots of things will break.

But almost any contribution will be beneficial at this point. Check the [current Issues](https://github.com/Shpigford/gemfile.directory/issues) to see where you can jump in!

If you've got an improvement, just send in a pull request!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

If you've got feature ideas, simply [open a new issues](https://github.com/Shpigford/gemfile.directory/issues/new)!

## License & Copyright

Released under the MIT license, see the [LICENSE](https://github.com/Shpigford/gemfile.directory/blob/main/LICENSE) file. Copyright (c) Sabotage Media LLC.
