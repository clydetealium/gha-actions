# gha-action
A place to store GitHub Actions for reuse in Tealium projects.

## Convention
To see an example of a GitHub Action that follows the convention, see the [pg-public action](./action-pg-public/).
### Naming
The convention for naming actions is to use the following format: `action-<action-name>`. For example, the action name for the `pg-public` action is `action-pg-public`.

### Versioning
Versioning for actions must take place via a version file i.e. action-<action-name>/VERSION. The version file should contain a single line with the version number. The version number should be in the format `X.Y.Z` where `X`, `Y`, and `Z` are integers. The version file must be updated with each change to the action.

Semvar versioning is not currently enforced via CI gatekeeping, but it is recommended and that the version number be updated according to the following rules:
- `X` should be incremented when a change is made that breaks backwards compatibility.
- `Y` should be incremented when a change is made that does not break backwards compatibility.
- `Z` should be incremented when a change is made that does not break backwards compatibility and is a bug fix.

### Documentation
Each action should have a README.md file that describes the action and how to use it. The README.md file should be located in the root of the action directory.
