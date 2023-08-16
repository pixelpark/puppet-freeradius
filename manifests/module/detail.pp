# @summary freeradius::module::detail
#
# @param ensure
# @param filename
# @param escape_filenames
# @param permissions
# @param group
# @param header
# @param locking
# @param log_packet_header
# @param suppress
define freeradius::module::detail (
  Enum['present','absent'] $ensure                 = 'present',
  String $filename                                 = "\${radacctdir}/%{%{Packet-Src-IP-Address}:-%{Packet-Src-IPv6-Address}}/detail-%Y%m%d",
  Freeradius::Boolean $escape_filenames            = 'no',
  String $permissions                              = '0600',
  Optional[String] $group                          = undef,
  String $header                                   = '%t',
  Optional[Freeradius::Boolean] $locking           = undef,
  Optional[Freeradius::Boolean] $log_packet_header = undef,
  Optional[Array[String]] $suppress                = [],
) {
  freeradius::module { "detail.${name}":
    ensure  => $ensure,
    content => template('freeradius/detail.erb'),
  }
}
