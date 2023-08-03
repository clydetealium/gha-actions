# pg-public
This is an action which scans a code base's diff for a file match on liquibase.properties. Each matching file's diff will be queried for an assignment of the defaultSchemaName property. The the property is assigned to `public` then the action will fail. This action is intended to be used as a check in a pull request workflow to ensure that no changes are made to the public schema.

## Usage

### Inputs

The following input parameters can be configured for this action:

- `from` (required): A scm ref that serves as the starting point for the comparison.
- `to` (required): A scm ref that serves as the ending point for the comparison.

### Example Workflow

Here's an example workflow that uses the action:
```yaml
name: liquibase public schema validation
on:
  pull_request:
    branches:
      - master
jobs:
  property-validation:
    name: ci tests
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Check For Default Schema Public
        uses: clydetealium/gha-action/action-pg-public@action-pg-public-2.0.2
        with:
          from: 'origin/master'
          to: 'HEAD'
```
