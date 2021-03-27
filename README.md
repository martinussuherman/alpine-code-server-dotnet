# alpine-code-server-dotnet

![GitHub](https://img.shields.io/github/license/martinussuherman/alpine-code-server-dotnet) ![Docker Pulls](https://img.shields.io/docker/pulls/martinussuherman/alpine-code-server-dotnet) ![Docker Stars](https://img.shields.io/docker/stars/martinussuherman/alpine-code-server-dotnet)

[![From Alpine](https://img.shields.io/badge/FROM-martinussuherman/alpine--code--server-brightgreen.svg)](https://hub.docker.com/r/martinussuherman/alpine-code-server)

![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/martinussuherman/alpine-code-server-dotnet/latest-net3.1) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/martinussuherman/alpine-code-server-dotnet/latest-net3.1)

![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/martinussuherman/alpine-code-server-dotnet/latest-net5.0) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/martinussuherman/alpine-code-server-dotnet/latest-net5.0)

![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/martinussuherman/alpine-code-server-dotnet/latest-net6.0) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/martinussuherman/alpine-code-server-dotnet/latest-net6.0)

![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/martinussuherman/alpine-code-server-dotnet/3.9.0-net3.1) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/martinussuherman/alpine-code-server-dotnet/3.9.0-net3.1)

![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/martinussuherman/alpine-code-server-dotnet/3.9.0-net5.0) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/martinussuherman/alpine-code-server-dotnet/3.9.0-net5.0)

![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/martinussuherman/alpine-code-server-dotnet/3.9.0-net6.0) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/martinussuherman/alpine-code-server-dotnet/3.9.0-net6.0)

---

## What is this image for ?

This is an [Minimal Alpine Linux image with glibc](https://hub.docker.com/r/jeanblanchard/alpine-glibc) based image for [code-server](https://github.com/cdr/code-server/) bundled with [.NET/.NET Core SDK](https://dotnet.microsoft.com). It enables one to run [VS Code](https://code.visualstudio.com/) in the browser for developing .NET/.NET Core application with [Omnisharp](https://github.com/OmniSharp/omnisharp-roslyn) support.

---

## Why use this image?

*code-server* service on this container will run as `non-root` (`vscode`) user. This add an extra layer of security and are generally recommended for production environments. This container also allow mapping of the `user id` dan `group id` of the user running docker to `vscode` user and group, which will enable the use of more restrictive file permission.

---

## How to use this image?

### *Using docker run*

```bash
$ docker run --name code-server -v ~/path/on/host:/home/vscode -e TZ=Asia/Jakarta -e EUID=$(id -u) -e EGID=$(id -g) -p 8080:8080 martinussuherman/alpine-code-server-dotnet
```
This will set the `timezone` to Asia/Jakarta (you will want to change it to your own timezone) and map the `user id` dan `group id` of the current user to `vscode` user and group.

### *Using docker-compose*

```yaml
version: '3'

services:
  code-server:
    image: martinussuherman/alpine-code-server-dotnet
    environment:
      - TZ=Asia/Jakarta
      - EUID=1001
      - EGID=1001
    volumes:
      - ~/path/on/host:/home/vscode
    ports:
      - 8080:8080

```

*Note:*
1. You will want to change the value for `EUID` and `EGID` with your current user `user id` dan `group id`.
2. *code-server* config file will be saved to `~/path/on/host/.config/code-server/config.yaml`
