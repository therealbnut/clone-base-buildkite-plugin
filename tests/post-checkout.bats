#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Quickly clones a repo at a different commit" {
  export BUILDKITE_AGENT_NAME="my-agent"
  export BUILDKITE_PIPELINE_NAME="my-pipeline"
  export BUILDKITE_REPO="git@github.com:therealbnut/clone-base-buildkite-plugin.git"
  export BUILDKITE_BUILD_CHECKOUT_PATH="$PWD"

  run "$PWD/hooks/post-checkout"

  assert_success
  assert_output --partial "Cleaning any residual files"
  assert_output --partial "Fetching base branch"
  assert_output --partial "Checking out"
  assert_output --partial "Cleaning again"
  assert_output --partial "Checked out"
}
