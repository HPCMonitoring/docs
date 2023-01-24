# HPC monitoring documentation

[![Deploy Status](https://github.com/HPCMonitoring/docs/workflows/CI/badge.svg?event=push)](https://github.com/HPCMonitoring/docs/actions?workflow=Deploy)

## Installation

Install [Rust toolchain](https://www.rust-lang.org/tools/install) first. Then install `mdbook`:

```bash
cargo install mdbook
```

## How to use

All contents of documentation in `src` folder. Do not modify other files directly.

To run this book:

```bash
mdbook serve [--port <your_port>]
```

If `--port` option is not provided, default host port is `3000`.

For book structure guide, visit <https://rust-lang.github.io/mdBook/format/summary.html>.
