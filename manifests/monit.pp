#
# == Class: denyhosts::monit
#
# Setups monit rules for denyhosts
#
class denyhosts::monit(
    $monitor_email
)
{

    include denyhosts::params

    monit::fragment { 'denyhosts-denyhosts.monit':
        modulename => 'denyhosts',
    }
}
