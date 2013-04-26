#
# == Class: denyhosts::install
#
# Installs denyhosts package
#
class denyhosts::install {

    package { 'denyhosts-denyhosts':
        name => 'denyhosts',
        ensure => installed,
    }
}
