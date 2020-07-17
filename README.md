# matrix_synapse

#### Table of Contents

1. [Description](#description)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Development - The status and goal of this module](#development)

## Description

This module simply installs and configures synapse, a reference implementation of a "homeserver" for the Matrix messaging system.

All configuration is done via hiera and is converted into homeserver.yaml via the hash_file module.

## Usage

To get started, include the `matrix_synapse` module and configure the contents of `homeserver.yaml` with the hash `matrix_synapse::homeserver_config` in hiera.

Some values are required since they are normally generated by the `--generate-config` script when installing manually.

```yaml
matrix_synapse::homeserver_config:
  server_name: yourdomain.tld # Required
  report_stats: true          # Required
  pid_file: /path/to/pid/file # Required
```

### Module parameters

#### matrix_synapse::user
The user to run synapse as. Will be created if not exists.

Default: matrix-synapse

#### matrix_synapse::install_dir
The location in which the virtual environment and the configuration files will be placed. The parent of this directory must exist.

Default: /opt/synapse

#### matrix_synapse::package_version
The version of the `matrix-synapse` package to install. Can be either 'latest' or a specific version of the package as a string.

Default: latest

## Development

This is mostly a personal project and should not be expected to be maintained for production use. Go ahead and make pull requests for improvements though.
