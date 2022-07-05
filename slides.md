---
author: John Allen
date: YYYY-MM-DD
paging: Slide %d / %d
---

# Conventional Commits and Release Automation

Combine convention and available tooling to automate repetitive tasks

---

# Conventional Commits

> A specification for adding human and machine readable meaning to commit messages

### Benefits

- Communicating the nature of changes to teammates / users
- Automatically determine a semantic version bump
- Automatically generate CHANGELOG entries

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Examples

Commit documentation change (internal)

```
docs: correct spelling of CHANGELOG
```

Commit a change to CI configuration (internal)

```
chore(ci): add release automation 🤘
```

Commit a new feature that is a breaking change (external)

```
feat(api)!: migrate from JSON to Protobuf
```

Alternative breaking change format

```
feat(api): migrate from JSON to Protobuf

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Phasellus vitae vulputate metus. Donec eu suscipit ante.
Vestibulum euismod commodo feugiat. Morbi eu elit odio.

BREAKING CHANGE: Default format changing to Protobuf
```

### Reference

- https://www.conventionalcommits.org/en/v1.0.0/

---

## Default Types

- `build`: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
- `ci`: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
- `docs`: Documentation only changes
- `feat`: A new feature
- `fix`: A bug fix
- `perf`: A code change that improves performance
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- `test`: Adding missing tests or correcting existing tests

### Reference

https://www.npmjs.com/package/@commitlint/config-angular

---

## Demo Setup

- Generate Ruby Gem with Bundler
- Add some GitHub Actions configuration
- Provide a valid Gemspec (for publishing)
- Create GitHub repo and push example gem

```bash
docker run -it --rm -w /usr/src/app -v "$PWD":/usr/src/app ruby:3.1 bash -c "bundle gem --no-coc --no-exe --no-ext --no-mit --changelog=true --linter=none --test=none --ci=none widgets"
cp -r github/ ./widgets/.github/
cp widgets.gemspec ./widgets/
cd widgets
git add .
git commit -m "feat: initial commit"
gh repo create widgets --public --disable-wiki --push --source .
gh repo view --web

```

---

## An Unconventional Commit

```bash
git pull
touch bar.txt
git add bar.txt
git commit -m "add bar.txt"
git push
```

`commitlint` in action @ `.github/workflows/commitlint.yml`

### Reference

https://github.com/wagoid/commitlint-github-action

---

## Our First Conventional Commit

```bash
git pull
echo "TODO: add notes about conventional commits" >> README.md
git add README.md
git commit -m "docs: update README.md"
git push
```

---

## Release Please

> Release Please automates CHANGELOG generation, the creation of GitHub releases, and version bumps for your projects.

### Options for Usage

- Manually via `npm` package
- Configured CI automation (e.g. GitHub Actions / ADO Pipelines)
- GitHub Application: https://github.com/apps/release-please

### App Configuration

@ `.github/release-please.yml`

### Reference

https://github.com/googleapis/release-please

---

## Commit Worthy of Release


```bash
git pull
touch index.html
git add index.html
git commit -m "feat!: add site homepage"
git push
```

---

## Package Release Automation

Automatically build an push package to registry.

### Workflow Configuration

@ `.github/workflows/release.yml`

---

## Further Reading

- https://www.conventionalcommits.org/en/about/
- https://github.com/conventional-changelog/conventional-changelog

---

- Tear it all down

```bash
gh repo delete --confirm
cd ..
rm -rf widgets
```
