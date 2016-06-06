class spacewalk::params {

  $reponame_spacewalk='spacewalk-repo'
  $db_postgres_setup='spacewalk-setup-postgresql'
  $spacewalk_setup='spacewalk-setup'

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^6.*$/:
        {
          $repo_spacewalk= 'http://yum.spacewalkproject.org/latest/RHEL/6/x86_64/spacewalk-repo-2.4-3.el6.noarch.rpm'
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
            {
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
