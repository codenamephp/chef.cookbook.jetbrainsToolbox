# Chef Cookbook
[![CI](https://github.com/codenamephp/chef.cookbook.jetbrainsToolbox/actions/workflows/ci.yml/badge.svg)](https://github.com/codenamephp/chef.cookbook.jetbrainsToolbox/actions/workflows/ci.yml)

## Resources

### Jetbrains Toolbox App
The `codenamephp_jetrbains_toolbox_app` resource installs or uninstalls the [Jetbrains toolbox][jetbrains_toolbox_url] which can then be used to manage the Jetbrains products.

#### Actions
- `:install`: Downloads the toolbox to a shared location and adds an X11 session script that installs the toolbox for the logged in user
- `:uninstall`: Deletes the shared script and the login script. Already installed apps for the users are not removed

#### Properties
- `toolbox_path`: The path where the files are downloaded to, extracted, ..., default: '/usr/share/jetbrains-toolbox'. If you have a custom path you need to provide it as well for the uninstall action.

#### Examples
```ruby
# Minmal parameters
codenamephp_jetbrains_toolbox_app 'install jetbrains-toolbox'

# Custom path
codenamephp_jetbrains_toolbox_app 'install jetbrains-toolbox' do
  toolbox_path '/my/custom/executable/path'
end

# Uninstall
codenamephp_jetbrains_toolbox_app 'uninstall jetbrains-toolbox' do
  toolbox_path '/my/custom/executable/path'
end
```
[jetbrains_toolbox_url]: https://www.jetbrains.com/toolbox-app/