# == Class: spacewalk
#
# === spacewalk documentation
#

# https://www.lisenet.com/2015/setup-spacewalk-2-4-on-centos-6/

class spacewalk(
                            $manage_package         = true,
                            $package_ensure         = 'installed',
                            $manage_service         = true,
                            $manage_docker_service  = true,
                            $service_ensure         = 'running',
                            $service_enable         = true,
                            $manage_db              = true,
                            $db_user                = 'spaceuser',
                            $db_password            = 'spacepassword',
                            $db_name                = 'spacedb',
                            $enable_tftp            = false,
                            $ssl_password           = 'spacesslpassword',
                            $sslcert_email          = 'root@spacewalk',
                            $sslcert_country        = 'AD',
                            $sslcert_state          = 'Barcelona',
                            $sslcert_city           = 'Barcelona',
                            $sslcert_orgunit        = 'example unit',
                            $sslcert_org            = 'example org',
                            $ssl_vhost              = true,
                            $admin_email            = 'root@spacewalk',
                            $spacewalk_responsefile = '/var/spacewalk/.responsefile.txt',
                          ) inherits spacewalk::params{

  include ::epel
  include ::jpackage

  Class['::epel'] ->
  class { '::spacewalk::repo::install': } ->
  class { '::spacewalk::master::postgres': } ->
  class { '::spacewalk::install': } ->
  class { '::spacewalk::config': } ~>
  class { '::spacewalk::service': } ->
  Class['::spacewalk']

}
