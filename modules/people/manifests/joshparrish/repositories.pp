class people::joshparrish::repositories (
  $my_sourcedir = $people::joshparrish::params::my_sourcedir,
  $my_homedir   = $people::joshparrish::params::my_homedir,
  $my_username  = $people::joshparrish::params::my_username
) {

  ###############################
  # Git config and repositories #
  ###############################

  git::config::global{ 'user.name':
    value => 'Josh Parrish',
  }

  git::config::global { 'alias.lg':
    value => "log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order",  }

  git::config::global { 'alias.review':
    value => 'log -p --reverse -M -C -C --patience --no-prefix',
  }

  git::config::global{ 'user.email':
    value => 'joshparrish@astate.edu',
  }

  git::config::global{ 'color.ui':
    value => 'auto',
  }

  git::config::global { 'alias.ll':
    value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat',
  }

  git::config::global { 'alias.dlc':
    value => 'diff --cached HEAD^',
  }
  
  repository { "/Users/${my_username}/.vim":
    source => 'glarizza/vim-puppet'
  }

  repository { "/Users/${my_username}/.vim/bundle/vim-colors-solarized":
    source  => 'altercation/vim-colors-solarized.git',
    require => Repository["/Users/${my_username}/.vim"],
  }

  repository { "/Users/${my_username}/.vim/bundle/vim-rust":
    source  => 'wting/rust.vim.git',
    require => Repository["/Users/${my_username}/.vim"],
  }

  repository { "${my_sourcedir}/octocatsay":
    source => 'cobyism/octocatsay',
  }

  repository { "${my_sourcedir}/solarized":
    source => 'altercation/solarized',
  }

  repository { "${my_sourcedir}/vim-plist":
    source  => 'hunner/vim-plist',
    require => Repository["/Users/${my_username}/.vim"],
  }

  file { "/Users/${my_username}/.vim/plugin/plist.vim":
    ensure  => file,
    source  => "${my_sourcedir}/vim-plist/plugin/plist.vim",
    require => Repository["${my_sourcedir}/vim-plist"],
  }

  file { '/usr/local/bin/octocatsay':
    ensure  => link,
    target  => "${my_sourcedir}/octocatsay/octocatsay",
    mode    => '0755',
    require => Repository["${my_sourcedir}/octocatsay"],
  }

  repository { "${my_sourcedir}/dotfiles":
    source => 'joshparrish/dotfiles',
  }

  file { "${my_homedir}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/tmux.conf",
    require => Repository["${my_sourcedir}/dotfiles"],
  }
  
  file { "/Users/${my_username}/.vimrc":
    ensure => link,
    mode   => '0644',
    target => "${my_sourcedir}/dotfiles/vimrc",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  repository { "${my_sourcedir}/luggage":
    source => 'unixorn/luggage',
  }

}
