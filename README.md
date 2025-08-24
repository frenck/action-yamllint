# 🚀 Frenck's Github Action: yamllint

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
![Project Maintenance][maintenance-shield]
[![License][license-shield]](LICENSE.md)

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

🚀 Frenck's GitHub Action for yamllint. A linter for YAML files.

## About

A very simple and easy to use GitHub Action for linting YAML files using
[yamllint][yamllint].

It annotates found issues, supports strict mode, can also fail on warnings if
wanted, and can be fully tuned using a yamllint configuration file.

## Usage

```yaml
name: Lint
on: [push, pull_request]
jobs:
  yamllint:
    name: yamllint
    runs-on: ubuntu-latest
    steps:
      - name: ⤵️ Check out code from GitHub
        uses: actions/checkout@v3
      - name: 🚀 Run yamllint
        uses: frenck/action-yamllint@v1
```

## Arguments

|   Input    |                          Description                           |   Usage    |
| :--------: | :------------------------------------------------------------: | :--------: |
|  `config`  | Path to custom configuration file (non-default YAMLLint path). | _Optional_ |
|   `path`   |                 Files (or directory) to check.                 | _Optional_ |
|  `strict`  |  Strict mode, causes linter warnings to be handled as errors.  | _Optional_ |
| `warnings` |    Allows for disabling warnings from (annotation) output.     | _Optional_ |

## Examples

The following examples demonstrate the usage of the GitHub Action with
the above arguments.

### Using a custom yamllint configuration file

You can customize the rules of yamllint by using a yamllint configuration file.
The action will automatically pick up configuration files on the default
configuration file location of yamllint. However, this option allows you
to you specify a custom configuration file location.

```yaml
- name: 🚀 Run yamllint
  uses: frenck/action-yamllint@v1
  with:
    config: "./custom/.yamllint"
```

### Limiting run to a specific folder or files

The yamllint run/action can be limited to a specific folder or files.
This example runs yamllint only on the YAML files located in the `src` folder.

```yaml
- name: 🚀 Run yamllint
  uses: frenck/action-yamllint@v1
  with:
    path: "src/"
```

### Running yamllint in strict mode

Running yamllint in strict mode, raising warnings as error. This will cause
the action to raise an failure, even when only warnings are found.

```yaml
- name: 🚀 Run yamllint
  uses: frenck/action-yamllint@v1
  with:
    strict: true
```

### Prevent yamllint warning being annotated

By default, the GitHub Action will annotate found issues, including warnings.
However, warnings are not errors and one could choose disabling the annotation
of warnings using the `warnings` argument.

```yaml
- name: 🚀 Run yamllint
  uses: frenck/action-yamllint@v1
  with:
    warnings: false
```

## Alternative

The funny part is, you don't need an GitHub Action specifically for yamllint.
yamllint is by default available on the GitHub's Action runners.

So you can do this alternatively:

```yaml
name: Lint
on: [push, pull_request]
jobs:
  build:
    name: yamllint
    runs-on: ubuntu-latest
    steps:
      - name: ⤵️ Check out code from GitHub
        uses: actions/checkout@v3
      - name: 🚀 Run yamllint
        run: |
          yamllint .
```

And... The above example, is faster, as it doesn't have a startup time, making
it around 5-10 seconds faster.

So, why this action?!

The action is version controlled and can be updated independently from GitHub's
runners. It prevents surprises, and using dependabot, you can actually know
when an upgrade happens.

Which version runs on the GitHub runner? And tomorrow?

Nevertheless, it is good to know the alternatives 😉

## Real-world examples

The following repositories are using this GitHub Action, and thus provide
you with some real-world uses of this GitHub Action.

- [Frenck's Home Assistant Configuration](https://github.com/frenck/home-assistant-config)
- [Metbril's :sunglasses: Home Assistant Configuration](https://github.com/metbril/home-assistant-config)
- [Pinkywafer's Home Assistant Configuration](https://github.com/pinkywafer/Home-Assistant_Config)

Are you using this GitHub Action? Feel free to open up a PR to add your
configuration to this list 😍

## Versions & Updating

You can specify which version of this GitHub Action your workflow should use.
And even allowing for using the latest major or minor version.

For example; this will use release `v1.1.1` of a GitHub Action:

```yaml
- name: 🚀 Run yamllint
  uses: frenck/action-yamllint@v1.1.1
```

While the following example, will use the `v1.1.x` minor release, for example
if `v1.1.2` is the latest releases (starting with `v1.1`), this will run
`v1.1.2`:

```yaml
- name: 🚀 Run yamllint
  uses: frenck/action-yamllint@v1.1
```

As in the examples throughout the documentation, the following example is
locked on major version, meaning any `v1.x.x` latest version will be used,
as long as it is version 1.

```yaml
- name: 🚀 Run yamllint
  uses: frenck/action-yamllint@v1
```

### Automatically update using Dependabot

The advantage of locking against a more specific version, is that it prevents
surprises if an issue or breaking changes were introduced in a newer release.

The disadvantage of being more specific, is that it requires you to keep things
up to date. Fortunately, GitHub has a tool for that, called: Dependabot.

Dependabot can automatically open a pull request on your repository to update
this Action for you. You can instantly see if the new version works (as the
pull request shows the success or failure status) and you can decide to
merge it in by hitting the merge button. Quick, easy and always up2date.

To enable Dependabot, create a file called `.github/dependabot.yaml`:

```yaml
version: 2
updates:
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: daily
```

Your all set! Dependabot will now check (and update) your GitHub actions
every day. 🤩

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We've set up a separate document for our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2021-2022 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[contributors]: https://github.com/frenck/action-yamllint/graphs/contributors
[frenck]: https://github.com/frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[license-shield]: https://img.shields.io/github/license/frenck/action-yamllint.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2022.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[releases-shield]: https://img.shields.io/github/release/frenck/action-yamllint.svg
[releases]: https://github.com/frenck/action-yamllint/releases
[semver]: http://semver.org/spec/v2.0.0.html
[yamllint]: https://github.com/adrienverge/yamllint
