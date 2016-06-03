class spacewalk::service inherits spacewalk {

  #
  validate_bool($spacewalk::manage_docker_service)
  validate_bool($spacewalk::manage_service)
  validate_bool($spacewalk::service_enable)

  validate_re($spacewalk::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${spacewalk::service_ensure}")

  if(getvar('::eyp_docker_iscontainer')==undef or
      getvar('::eyp_docker_iscontainer')==false or
      getvar('::eyp_docker_iscontainer') =~ /false/ or
      $spacewalk::manage_docker_service)
  {
    if($spacewalk::manage_service)
    {
      #service or exec here
    }
  }
}
