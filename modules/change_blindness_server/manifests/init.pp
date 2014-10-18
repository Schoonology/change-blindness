class change_blindness_server {
  include nginx_server
  include docker_server

  nginx::resource::upstream { 'change_blindness':
    ensure => present,
    members => [
      'localhost:8080',
    ],
  }

  nginx::resource::vhost { 'default':
    ensure => present,
    proxy => 'http://change_blindness',
    server_name => ['$hostname'],
  }
}
