class spacewalk::repo::install inherits spacewalk {

  if($spacewalk::manage_package)
  {
    package { $spacewalk::params::reponame_spacewalk:
      ensure   => 'installed',
      provider => 'rpm',
      source   => $spacewalk::params::repo_spacewalk,
    }
  }

}
