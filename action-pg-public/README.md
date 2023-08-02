# pg-public
This is an action which scans a code base's diff for a file match on liquibase.properties. Each matching file's diff will be queried for an assignment of the defaultSchemaName property. The the property is assigned to `public` then the action will fail. This action is intended to be used as a check in a pull request workflow to ensure that no changes are made to the public schema.

## Usage
To use an action in a workflow, add the following step to the workflow:
```yaml
      - name: Check For Default Schema Public
        uses: clydetealium/gha-action/action-pg-public@v0.0.1
```

more stuff
more stuff
more stuff
