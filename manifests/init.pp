# @summary Main class for the module
#
# @example
#   include matrix_synapse
class matrix_synapse (
  Hash $homeserver_config = {},
  String $user = 'matrix-synapse',
  String $install_dir = '/opt/synapse',
  Variant[Enum[latest], String[1]] $package_version = latest,
) {
  contain matrix_synapse::install
  contain matrix_synapse::config
  contain matrix_synapse::service
}
