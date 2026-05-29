## Rails Version Issue

Rails 8.1.3 produced a syntax error when generating a controller on the VM. To resolve this, the project was adjusted to use Rails 7.2, which is stable and compatible with the installed Ruby environment.

## Rails Version Compatibility Issue

The Rails app was originally generated with Rails 8.1 defaults. After downgrading Rails to 7.2, the application still referenced `config.load_defaults 8.1`, which caused Rails to fail when generating controllers.

This was fixed by changing the line in `config/application.rb` to:

```ruby
config.load_defaults 7.2