# Neovim Configuration

This repository contains my personal Neovim configuration, built to be modular, Windows-friendly, and easy to adapt into alternate profiles without having to restructure the entire setup.

The config is designed around a few key ideas:

- Run cleanly in a Windows environment with PowerShell 7 as the default terminal
- Allow profile-specific overrides through a dedicated Lua profile folder
- Separate machine-specific values into a local config file
- Use Lazy.nvim for plugin management, trying to follow its best practices in terms of pluginc config setups

---

## Overview

This Neovim setup is organized so that the main configuration can remain mostly unchanged, while profile-specific behavior can be swapped in with minimal edits.

At a high level:

- The root `init.lua` acts as the main entry point
- A profile folder under `lua/` contains the profile-specific configuration
- A `config/local.lua` file contains local machine values such as filesystem paths
- Plugins are managed with [Lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP languages installed/managed with [Mason.nvim](https://github.com/williamboman/mason.nvim)
- The setup is intended to run fully on Windows, using PowerShell 7 as the default shell

---

## Profile-Based Layout

One of the main design goals of this config is to make it easy to create a spinoff profile without rewriting the whole repository.

Under the root `lua/` folder, there is a profile-specific folder that contains the actual configuration modules used by the active setup. This allows someone to:

- keep the existing root config intact
- create a new profile folder for experimentation or alternate environments
- switch profiles by making only a small change in the root `init.lua`

This makes it easier to maintain:

- a primary personal setup
- a work-specific setup
- a minimal or experimental spinoff config

without needing to duplicate the entire repository structure.

---

## Local Machine Configuration

This repo expects a local configuration file at:

`lua/config/local.lua`

A template/example version is included in the repository:

`lua/config/local.example.lua`

The purpose of `local.lua` is to hold values that are specific to an individual machine, for usage in config definitions.

Typical examples include:

- local development folder paths
- project root locations
- other machine-specific values referenced by plugin configs

---

## First-Time Setup

On a new machine, the typical setup flow is:

1. Clone this repository into your Neovim config directory
2. Ensure Neovim is installed
3. Ensure PowerShell 7 is installed
4. Copy `lua/config/local.example.lua` to `lua/config/local.lua`, and update the values accordingly
5. Launch Neovim and allow Lazy.nvim to install plugins
6. Run :Mason and install primary LSP languages

Depending on the plugins in use, you may also need additional tools installed separately.

Examples may include:

- Git
- a Nerd Font
- Node.js
- ripgrep
- fd

Check documentation on specific plugins for more information.

---

## Notes

This config is intentionally structured to be maintainable and customizable rather than packed into one large monolithic file.

The main goals are:

- easier long-term maintenance
- cleaner organization
- profile-based flexibility
- simpler onboarding on a new machine

If you are adapting this repository for your own use, the easiest path is usually:

- create your own profile folder
- update `init.lua` to load that profile
- set up that profile however you want

That lets you inherit the overall structure and tinker with it to suit your needs while still keeping the original config offered here intact.
