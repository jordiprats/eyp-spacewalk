class spacewalk::master::postgres() inherits spacewalk {

#  spacewalk-setup-postgresql.noarch : Tools to setup embedded PostgreSQL database for Spacewalk

# [root@spacewalk ~]# spacewalk-setup-postgresql create --db spacedb --user spaceuser --password spacepassword

# [root@spacewalk pgsql]# /usr/bin/postmaster --version
# postgres (PostgreSQL) 8.4.20
# [root@spacewalk pgsql]#

  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  if($spacewalk::manage_package)
  {
    package { $spacewalk::params::db_postgres_setup:
      ensure => 'installed',
      before => Exec['spacewalk db-setup'],
    }
  }

  exec { 'spacewalk db-setup':
    command => "spacewalk-setup-postgresql create --db ${spacewalk::db_name} --user ${spacewalk::db_user} --password ${spacewalk::db_password}",
    unless  => "spacewalk-setup-postgresql check --db ${spacewalk::db_name} --user ${spacewalk::db_user}",
  }

  if($spacewalk::manage_db)
  {
    #TODO: manage postgres
  }

}
