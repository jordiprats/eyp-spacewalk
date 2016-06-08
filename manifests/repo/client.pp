class spacewalk::repo::client inherits spacewalk {

  if($spacewalk::client::manage_package)
  {
    package { $spacewalk::params::reponame_spacewalkclient:
      ensure   => 'installed',
      provider => 'rpm',
      source   => $spacewalk::params::repo_spacewalkclient,
    }
  }

}
