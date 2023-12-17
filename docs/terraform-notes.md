# GCP TF Best Practices

- Follow [standard module
  structure](https://developer.hashicorp.com/terraform/language/modules/develop)
  - Start every module with a `main.tf` file
  - Include a `README.md` file in every module
  - Place examples in an `/examples` folder, each with their own `README.md`
  - Create logical grouping of resources such as `network.tf`, `instances.tf`,
    `loadbalancer.tf`, etc.
  - Only include `.tf` and metadata files (such as `README.md` and `CHANGELOG.md`)
    in a module's root directory
- Naming conventions
  - `resource "google_compute_instance" "web_server"` instead of `web-server`
  - Resources that are the only one of it's type should be called `"main"`
  - Consider `"primary"` and `"secondary"` for resources that are not the only
    one of it's type
  - Resource names should be singular
  - Don't repeat resource type in the resource name
- Variables
  - variable names should include unit type when numerical, i.e. `ram_size_gb`
  - Use binary unit prefixes, i.e. `kibi`, `mebi`, `gibi`, etc.
  - To simplify conditional logic use positive names, i.e.
    `enable_external_access`
- Expose outputs
- Use data sources
  - Put data sources next to the resources that reference them. If the number of
    data sources becomes large, consdier a `data.tf` file.
- Protect stateful resources, i.e. `lifecycle { prevent_destroy = true }`
- Use built-in formatting, i.e. `terraform fmt`
- Limit expression complexity
  - split complexity in local values
- Use count for conditional values
- Use for_each for iterated resources
