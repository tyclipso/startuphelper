# Startup helper Docker Image

This Docker Image aims to act as an startup helper for multitask applications.

## Installed packages

This Image is based on a debian slim image and contains the following packages:

- curl
- gpg
- jq
- lsb-release
- vault

## Example usage

This Image can help to setup secrets stored in vault and place them for an application, which cant communicate with vault oob.
