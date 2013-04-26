#
# == Class: denyhosts
#
# Denyhosts class installs and configures denyhosts daemon which helps prevent 
# SSH brute forcing attempts.
#
# == Parameters
#
# [*deny_threshold_valid*]
#   Deny valid users from retrying ssh authentication after this many failed
#   logins
# [*deny_threshold_invalid*]
#   Same as above but for invalid users 
# [*deny_threshold_restricted*]
#   Same as above but for restricted users (for details see denyhosts
#   documentation)
# [*deny_threshold_root*]
#   Same as above but for the root user 
# [*allowed_hosts*]
#   A string array containing whitelisted addresses or subnets
# [*email*]
#   Email address where deny reports are sent to. Defaults to global variable
#   $::servermonitor. Use an empty string to disable email reports, which can be
#   numerous.
#
# == Examples
#
# class { 'denyhosts':
#   allowed_hosts => ['localhost', 'mycomputer.domain.com'],
#   email => '',
# }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license
# See COPYING.txt
# 
class denyhosts(
    $deny_threshold_valid = 10,
    $deny_threshold_invalid = 5,
    $deny_threshold_restricted = 5,
    $deny_threshold_root = 3,
    $allowed_hosts = ['localhost'],
    $email = $servermonitor
    )
{
    include denyhosts::install

    class { 'denyhosts::config':
        deny_threshold_valid => $deny_threshold_valid,
        deny_threshold_invalid => $deny_threshold_invalid,
        deny_threshold_restricted => $deny_threshold_restricted,
        deny_threshold_root => $deny_threshold_root,
        allowed_hosts => $allowed_hosts,
        email => $email,
    }

    include denyhosts::service
    include denyhosts::monit
}
