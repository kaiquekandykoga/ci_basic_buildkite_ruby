# ci_basic_buildkite_ruby

This is a personal repository for learning and practising Buildkite pipelines

# Self-notes

Buildkite uses plugins from https://buildkite.com/resources/plugins/

I can run Ruby inside Docker plugin https://buildkite.com/resources/plugins/buildkite-plugins/docker-buildkite-plugin/

## Examples

#### Example 00

The commands are appended using &&

Therefore, something like:

```
  - command:
    - echo "Starting script.rb"
    - ruby script.rb
```

Will become:

```
echo "Starting script.rb" && ruby script.rb
```

YAML Steps (complete example)

```
steps:
  - command:
    - echo "Starting script.rb"
    - ruby script.rb
    label: "ci_basic_buildkite_ruby label"
    plugins:
      - docker#v5.13.0:
          image: ruby:4.0
```

#### Example 01

Buildkite with multiple steps (build, test)

YAML Steps (complete example)

```
steps:
  - key: "key_00"
    command:
    - echo "Starting script_00.rb"
    - ruby script_00.rb
    label: "It could be the build step"
    plugins:
      - docker#v5.13.0:
          image: ruby:4.0

  - key: "key_01"
    depends_on: ["key_00"]
    command:
      - echo "Installing gems"
      - bundle install --jobs=4 --retry=3
      - echo "Running rake test"
      - bundle exec rake test
    label: "It could be the test step"
    plugins:
      - docker#v5.13.0:
          image: ruby:4.0
```
