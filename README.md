# tfmodules

Reusable Terraform Modules

## Conventions

Each module should be in its own directory.

Each module directory should contain a README documenting variables,
outputs, and showing some sample code.

Variables should be split out into `variables.tf` and outputs into
`outputs.tf`. Group other resources together however you think is
reasonable. For a very small, simple state, it might be fine to put
everything in one `main.tf`. For a larger one, you might want to split
it by resource type.

If a resource supports tags or labels, add a `Terraform = true`
label/tag on it (this makes it easier for us to see what resources are
managed by terraform when we're in a console).
