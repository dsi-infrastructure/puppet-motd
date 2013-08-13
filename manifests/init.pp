# class motd
#
class motd {
  file { '/etc/motd':
    ensure => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/motd/motd',
  }

  file { '/etc/skel/.info.sh':
    ensure => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0744',
    source  => 'puppet:///modules/motd/info.sh',
  }

  file { '/etc/skel/.bashrc':
    ensure => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/motd/bashrc',
  }
}
