

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

package { 'makepasswd':
  ensure => '1.10-9',
  require  => Exec['apt-get update'],
}

package { 'git':
  ensure => present,
  require  => Exec['apt-get update'],
}

file { '/etc/update-motd.d/55-squid-welcome':
  source => 'puppet:///nubis/files/squid-welcome',
  owner => 'root',
  group => 'root',
  mode  => '0755',
}

exec { 'motd update':
  command => '/bin/run-parts /etc/update-motd.d/ > /var/run/motd.dynamic',
  require  => File['/etc/update-motd.d/55-squid-welcome'],
}
