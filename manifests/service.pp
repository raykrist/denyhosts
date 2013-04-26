#
# == Class: denyhosts::service
#
# Configures denyhosts to start on boot
#
class denyhosts::service {

    include denyhosts::params

    service { 'denyhosts':
        enable => true,
        name => 'denyhosts',
        hasstatus => $service_hasstatus,
        require => Class['denyhosts::config'],
    }
}
