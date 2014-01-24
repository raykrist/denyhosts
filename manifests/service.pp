#
# == Class: denyhosts::service
#
# Configures denyhosts to start on boot
#
class denyhosts::service (
  $service_hasstatus = $denyhosts::params::service_hasstatus
){

  service { 'denyhosts':
    enable => true,
    name => 'denyhosts',
    hasstatus => $service_hasstatus,
    require => Class['denyhosts::config'],
  }
}
