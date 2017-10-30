exec { 'apt-get update': 
    command => '/usr/bin/apt-get update',
}

group { 'puppet':
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'nginx': 
	ensure => present,
}

service { 'nginx':
	ensure => running,
	require => Package['nginx'],
}

file { '/usr/share/nginx/html/index.html':
    owner => root,
    group => root,
    mode => 0644,
    ensure  => file,
    content  => template("/vagrant/private/puppet/templates//index.erb"),
    require => Package['nginx'];
}
