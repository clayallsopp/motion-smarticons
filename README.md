# motion-smarticons

motion-smarticons lets you overlay information text like commit hash and version number on top of RubyMotion app icons:

![Default smarticons](http://i.imgur.com/Is0Cc9i.png)

## Installation

- `gem install motion-smarticons`
- `require 'motion-smarticons'`

or add it to your `Gemfile`:

- `gem 'motion-smarticons'`

## Usage

Add the smarticons commands at the end of your `Motion::Project::App.setup` block to ensure your icons and app info is finalized before generating the new icons.

By default, smarticons will display the `app.version` and latest commit hash, using the `#smarticons!` method:

```ruby
Motion::Project::App.setup do |app|
  # ...

  app.smarticons!
end
```

![Default smarticons](http://i.imgur.com/GPgwZRv.png)

If you want to display a custom string, simply use `#smarticons=`:

```ruby
Motion::Project::App.setup do |app|
  # ...

  app.smarticons = "Hello World"
end
```

![Custom smarticons](http://i.imgur.com/v5lDmDq.png)

## Gotchas

iOS will cache old app icons, even after a clean build. If your icon hasn't updated, move it in and out of a folder to update it to the latest version.

## Credits

Shoutout to [@merowing_](http://twitter.com/merowing_) for his article on [generating app icons](http://www.merowing.info/2013/03/overlaying-application-version-on-top-of-your-icon).

## Contact

Clay Allsopp ([http://clayallsopp.com](http://clayallsopp.com))

- [http://twitter.com/clayallsopp](http://twitter.com/clayallsopp)
- [clay@usepropeller.com](clay@usepropeller.com)

## License

motion-smarticons is available under the MIT license. See the LICENSE file for more info.