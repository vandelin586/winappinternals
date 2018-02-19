# == Class winappinternals::service
#
# This class is meant to be called from winappinternals.
# It ensure the service is running.
#
class winappinternals::service {

  service { $::winappinternals::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
