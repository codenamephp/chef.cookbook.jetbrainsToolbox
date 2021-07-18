# Chef Cookbook
%%BUILD_BADGE%%

To get started, lookup all the %%PLACEHOLDERS%% and replace them with the actual values.

To get started with the cookbook, use chef generate -I apachev2 -C CodenamePHP [recipe, resource, ...]

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 15.3+

### Cookbook Depdendencies

## Usage

Add the cookbook to your Berksfile:

```
cookbook '%%COOKBOOK_NAME%%'
```

Add the cookbook to your runlist, e.g. in a role:


```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[%%COOKBOOK_NAME%%]"
  ]
}
```
