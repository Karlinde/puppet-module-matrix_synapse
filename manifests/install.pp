# @summary Installs synapse
#
# Installs prerequisites, sets up the installation directory and 
# installs synapse in a virtual environment.
#
# @api private
class matrix_synapse::install {
  package {[
    'build-essential',
    'libffi-dev',
    'sqlite3',
    'libssl-dev',
    'libjpeg-dev',
    'libxslt1-dev',
  ]:
    ensure => present,
  }

  class { 'python':
    version    => '3',
    pip        => present,
    virtualenv => present,
  }

  user {$matrix_synapse::user:
    ensure => present,
  }

  file {$matrix_synapse::install_dir:
    ensure  => directory,
    owner   => $matrix_synapse::user,
    require =>  User[$matrix_synapse::user],
  }

  $venv = "${matrix_synapse::install_dir}/venv"

  python::virtualenv {$venv:
    require => File[$matrix_synapse::install_dir]
  }

  python::pip {'matrix-synapse':
    ensure     => $matrix_synapse::package_version,
    virtualenv => $venv,
    require    => Python::Virtualenv[$venv],
  }

  python::pip {'jinja2':
    virtualenv => $venv,
    require    => Python::Virtualenv[$venv],
  }
}
