# == Class: spacewalk
#
# === spacewalk documentation
#
class spacewalk(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits spacewalk::params{

  class { '::spacewalk::master::db': } ->
  class { '::spacewalk::install': } ->
  class { '::spacewalk::config': } ~>
  class { '::spacewalk::service': } ->
  Class['::spacewalk']

}
