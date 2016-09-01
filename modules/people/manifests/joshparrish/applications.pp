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
    'imagemagick'
   ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }


}
