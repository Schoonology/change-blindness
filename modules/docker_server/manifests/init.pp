class docker_server {
  Exec {
    path => [
      '/usr/local/bin',
      '/usr/bin',
      '/bin',
    ],
  }

# curl -sSL https://get.docker.io/ubuntu/ | sudo sh
  exec { 'update-apt':
    command => 'apt-get update',
    logoutput => true,
  }

  package { 'linux-image-generic-lts-raring':
    ensure => present,
    require => Exec['update-apt'],
    before => Exec['update-apt-with-docker'],
  }

  package { 'linux-headers-generic-lts-raring':
    ensure => present,
    require => Exec['update-apt'],
    before => Exec['update-apt-with-docker'],
  }

  package { 'linux-generic-lts-raring':
    ensure => present,
    require => Exec['update-apt'],
    before => Exec['update-apt-with-docker'],
  }

  exec { 'add-docker-key':
    command => 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9',
    logoutput => true,
    before => Exec['update-apt-with-docker'],
  }

  exec { 'add-docker-repo':
    command => 'echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list',
    before => Exec['update-apt-with-docker'],
  }

  exec { 'update-apt-with-docker':
    command => 'apt-get update',
  }
  ->
  package { 'lxc-docker':
    ensure => present,
  }
}
