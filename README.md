# clone-base-buildkite-plugin
A Buildkite plugin to clone the PR base branch in addition to the target branch

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: ls
    plugins:
      - therealbnut/clone-base#v1.0.0:
          checkout_path: "/var/lib/buildkite-agent/builds/${BUILDKITE_AGENT_NAME}/${BUILDKITE_PIPELINE_NAME}"
          branch: "${BUILDKITE_PULL_REQUEST_BASE_BRANCH}"
```

## Configurations

The plugin accepts the following environment variables to configure its behaviour:

 * `BUILDKITE_PLUGIN_CLONE_BASE_CHECKOUT_PATH`

     - *Required* No
     - *Description* The absolute path where the base branch should be cloned.

 * `BUILDKITE_PLUGIN_CLONE_BASE_BRANCH`

     - *Required* No
     - *Description* The branch reference to clone.

 * `BUILDKITE_PLUGIN_CLONE_BASE_SUBPATH`

     - *Required* No
     - *Description* Specify if you only want to checkout a subpath.
