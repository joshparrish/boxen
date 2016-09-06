class people::joshparrish::applications {
  include chrome
  include spotify
  include iterm2::stable

  $homebrew_packages = [
    'tree',
    'curl',
    'gawk',
    'wget',
    'zsh',
    'nmap',
    'tmux',
    'rust',
    'libxml2',
    'imagemagick',
    'tidyp',
    'astyle',

  ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }
  
  package { 'dropbox': provider => 'brewcask' }
  package { 'mactracker': provider => 'brewcask' }
  package { 'packages': provider => 'brewcask' }
  package { 'pacifist': provider => 'brewcask' }
  package { 'onyx': provider => 'brewcask' }
  package { 'disk-drill': provider => 'brewcask' }
 

}
