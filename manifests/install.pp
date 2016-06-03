# == Class: spacewalk
#
# === spacewalk::install documentation
#
class spacewalk::install inherits spacewalk {

  if($spacewalk::manage_package)
  {
    # package here, for example:
    #package { $spacewalk::params::package_name:
    #  ensure => $spacewalk::package_ensure,
    #}
    package { $spacewalk::params::reponame_spacewalk:
      ensure   => 'installed',
      provider => 'rpm',
      source   => $spacewalk::params::repo_spacewalk,
    }
  }

}
