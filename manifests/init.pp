# Class: winappinternals
# ===========================
#
# Full description of class winappinternals here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class winappinternals (
  $package_name = $::winappinternals::params::package_name,
  $service_name = $::winappinternals::params::service_name,
) inherits ::winappinternals::params {

  # validate parameters here

  class { '::winappinternals::install': } ->
  class { '::winappinternals::config': } ~>
  class { '::winappinternals::service': } ->
  Class['::winappinternals']
}
