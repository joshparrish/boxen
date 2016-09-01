class people::joshparrish (
  $my_username  = $people::joshparrish::params::my_username,
  $my_homedir   = $people::joshparrish::params::my_homedir,
  $my_sourcedir = $people::joshparrish::params::my_sourcedir,
) inherits people::joshparrish::params {
  ## Declare all subclasses
  include people::joshparrish::applications
  include people::joshparrish::repositories
  include people::joshparrish::config
}
