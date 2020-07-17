# @summary Manages the systemd service for synapse
#
# @api private
class matrix_synapse::service {
  $service_file = '/etc/systemd/system/matrix-synapse.service'
  file {$service_file:
    ensure  => present,
    content => epp('matrix_synapse/matrix-synapse.service.epp'),
    require => Class['matrix_synapse::config'],
  }

  service {'matrix-synapse':
    ensure    => running,
    enable    => true,
    subscribe => [
      File[$service_file],
      Hash_file[$matrix_synapse::config::config_file],
    ],
  }
}
