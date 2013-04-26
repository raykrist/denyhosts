#
# == Class: denyhosts::monit
#
# Setups monit rules for denyhosts
#
class denyhosts::monit {

    include denyhosts::params

    monit::fragment { 'denyhosts-denyhosts.monit':
        modulename => 'denyhosts',
    }
}
