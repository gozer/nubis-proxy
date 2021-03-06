class { 'fluentd':
  service_ensure => stopped
}

fluentd::configfile { 'squid': }

fluentd::source { 'squid_access':
  configfile => 'squid',
  type       => 'tail',
  format     => 'none',
  tag        => 'forward.squid.access',
  config     => {
    'path' => '/var/log/squid3/access.log',
  },
}

fluentd::source { 'squid_cache':
  configfile => 'squid',
  type       => 'tail',
  format     => 'none',
  tag        => 'forward.squid.cache',
  config     => {
    'path' => '/var/log/squid3/cache.log',
  },
}

fluentd::source { 'squid_store':
  configfile => 'squid',
  type       => 'tail',
  format     => 'none',
  tag        => 'forward.squid.store',
  config     => {
    'path' => '/var/log/squid3/store.log',
  },
}
