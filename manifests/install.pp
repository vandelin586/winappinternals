# == Class winappinternals::install
#
# This class is called from winappinternals for install.
#
class winappinternals::install {

  package { $::winappinternals::package_name:
    ensure => present,
  }
}
