These are files used to populate the image.

The `.ssh` directory is needed because

- `Documenter.jl` expects it for `~/.ssh/config`,

- when deploying the documentation via the `git@` protocol, `ssh` needs host keys confirmed for `github.com`, but cannot ask interactively, so it fails.

The installation script fetches and extracts the Julia binaries.
