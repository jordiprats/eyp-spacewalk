# == Class: spacewalk
#
# === spacewalk::install documentation
#
class spacewalk::install inherits spacewalk {

  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  if($spacewalk::manage_package)
  {
    package { $spacewalk::spacewalk_setup:
        ensure => 'installed',
    }
  }

  file { $spacewalk::spacewalk_responsefile:
    ensure => 'present',
    owner => 'root',
    group => 'root',
    mode => '0400',
    content => template("${module_name}/responsefile.erb"),
  }

  # spacewalk-setup --disconnected --answer-file=/var/spacewalk/.responsefile.txt --external-postgresql

  # db_password = spacepassword

  exec { 'spacewalk-setup':
    command => "spacewalk-setup --disconnected --answer-file=${spacewalk::spacewalk_responsefile} --external-postgresql",
    unless  => "grep 'db_password = ${spacewalk::db_password}' /etc/rhn/rhn.conf",
    require => File[$spacewalk::spacewalk_responsefile],
  }

}
