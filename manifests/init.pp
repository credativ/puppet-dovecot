# = Class: dovecot
#
# Install dovecot core
#
# == Parameters:
#
# [* ensure *]
#   What state to ensure for the package. Accepts the same values
#   as the parameter of the same name for a package type.
#   Default: present
#
# [* ensure_running *]
#   Weither to ensure running dovecot or not.
#   Default: running
#

class dovecot (
    $ensure         = hiera('dovecot::ensure', present),
    $ensure_running = hiera('dovecot::ensure_running', running),
) {
    $config_dir_d = "/etc/dovecot/conf.d"

    package { 'dovecot-core':
        ensure => $ensure
    }

    service { 'dovecot':
        ensure     => $ensure_running,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['dovecot-core'],
    }
}

