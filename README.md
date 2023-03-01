# HPC monitoring documentation

[![Deploy Status](https://github.com/HPCMonitoring/docs/workflows/Build%20and%20deploy/badge.svg?event=push)](https://github.com/HPCMonitoring/docs/actions?workflow=Build%20and%20deploy) [![Testing Status](https://github.com/HPCMonitoring/docs/workflows/Test/badge.svg?event=pull_request)](https://github.com/HPCMonitoring/docs/actions?workflow=Test)

## Installation

Download `mdbook` and add into `/usr/local/bin` folder:

```bash
curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.14/mdbook-v0.4.14-x86_64-unknown-linux-gnu.tar.gz | sudo tar -xz --directory=/usr/local/bin
```

## How to use

All contents of documentation in `src` folder. Do not modify other files directly.

To run this book:

```bash
mdbook serve [--port <your_port>]
```

If `--port` option is not provided, default host port is `3000`.

For book structure guide, visit <https://rust-lang.github.io/mdBook/format/summary.html>.

## Use this template to create your own document page

This section will show you how to use `gh-pages` to deploy this book on your own domain.

Firstly, click `Use this template` button & choose `Create a new repository`.

![image1](./assets/create-repo-from-template.png)

Then, you will be redirected to create new repository page of Github. Filter out informations and submit. The new repository should look like this:

![image2](./assets/create-repo-success.png)

Secondly, in your already created repository, visit `Setting` -> `Pages` and configure like this:

![image3](./assets/setting.png)

Finally, wait for some minutes and refresh current page. You will see the result:

![image3](./assets/result.png)
