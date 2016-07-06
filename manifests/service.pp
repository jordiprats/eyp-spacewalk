class spacewalk::service inherits spacewalk {

  #
  validate_bool($spacewalk::manage_docker_service)
  validate_bool($spacewalk::manage_service)
  validate_bool($spacewalk::service_enable)

  validate_re($spacewalk::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${spacewalk::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $spacewalk::manage_docker_service)
  {
    if($spacewalk::manage_service)
    {
      #service or exec here
    }
  }
}
