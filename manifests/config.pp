# @summary Generates the synapse configuration file
#
# @api private
class matrix_synapse::config {

  $config_file = "${matrix_synapse::install_dir}/homeserver.yaml"

  hash_file {$config_file:
    value    => $matrix_synapse::homeserver_config,
    provider => 'yaml',
    require  => Class['matrix_synapse::install'],
  }
}
