#
# Class: denyhosts::config
#
# Configures denyhosts daemon
#
class denyhosts::config(
    $deny_threshold_valid = $denyhosts::deny_threshold_valid,
    $deny_threshold_invalid = $denyhosts::deny_threshold_invalid,
    $deny_threshold_restricted = $denyhosts::deny_threshold_restricted,
    $deny_threshold_root = $denyhosts::deny_threshold_root,
    $allowed_hosts = $denyhosts::allowed_hosts,
    $email = $denyhosts::email,
) {

    file { 'denyhosts-denyhosts.conf':
        ensure => present,
        path => '/etc/denyhosts.conf',
        content => template('denyhosts/denyhosts.conf.erb'),
        owner => root,
        group => 'root',
        mode => 0644,
        notify => Class['denyhosts::service'],
    }

    file { 'denyhosts-hosts.allow':
        ensure => present,
        path => '/etc/hosts.allow',
        content => template('denyhosts/hosts.allow.erb'),
        owner => root,
        group => root,
        mode => 0644,
        notify => Class['denyhosts::service'],
    }
}
