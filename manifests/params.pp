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
        }
        'Debian': {
            $pidfile = '/var/run/denyhosts.pid'
            $secure_log = '/var/log/auth.log'
        }
        default: {
            $pidfile = '/var/run/denyhosts.pid'
            $secure_log = '/var/log/auth.log'
        }
    }
}
