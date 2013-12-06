#
# == Class denyhosts::params
#
# Defines some variables based on the operating system
#
class denyhosts::params {

   # On some platforms the init script does not have a "status" target,
   # which means config change does not trigger a service restart without
   # "hastatus => false"
   case $::lsbdistcodename {
        'squeeze': {
            $service_hasstatus = 'false'
        }
        'lucid': {
            $service_hasstatus = 'false'
        }
        default: {
            $service_hasstatus = 'true'
        }
    }

    case $::osfamily {
        'RedHat': {
            $pidfile = '/var/lock/subsys/denyhosts'
            $secure_log = '/var/log/secure'
            $service_name = 'denyhosts'

            if $::operatingsystem == 'Fedora' {
                $service_start = "/usr/bin/systemctl start ${service_name}.service"
                $service_stop = "/usr/bin/systemctl stop ${service_name}.service"
            } else {
                $service_start = "/sbin/service $service_name start"
                $service_stop = "/sbin/service $service_name stop"
            }
        }
        'Debian': {
            $pidfile = '/var/run/denyhosts.pid'
            $secure_log = '/var/log/auth.log'
            $service_name = 'denyhosts'
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
        }
        default: {
            $pidfile = '/var/run/denyhosts.pid'
            $secure_log = '/var/log/auth.log'
            $service_name = 'denyhosts'
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
        }
    }
}
