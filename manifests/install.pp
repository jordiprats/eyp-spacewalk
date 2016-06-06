# == Class: spacewalk
#
# === spacewalk::install documentation
#
class spacewalk::install inherits spacewalk {

  if($spacewalk::manage_package)
  {
    package { $spacewalk::spacewalk_setup:
        ensure => 'installed',
    }
  }

}
