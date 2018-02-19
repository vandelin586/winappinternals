# == Class winappinternals::params
#
# This class is meant to be called from winappinternals.
# It sets variables according to platform.
#
class winappinternals::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'winappinternals'
      $service_name = 'winappinternals'
    }
    'RedHat', 'Amazon': {
      $package_name = 'winappinternals'
      $service_name = 'winappinternals'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
