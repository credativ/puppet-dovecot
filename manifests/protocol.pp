# = Define: dovecot::protocol
#
# Install dovecot protocol
#
# == Parameters:
#
# [* ensure *]
#   What state to ensure for the package. Accepts the same values
#   as the parameter of the same name for a package type.
#   Default: present
#

define dovecot::protocol ($ensure = present) {
    require dovecot

    $package = $title ? {
        'imap'  => 'dovecot-imapd',
        'sieve' => 'dovecot-managesieved',
    }

    package { $package:
        ensure => $ensure,
        notify => Service[dovecot],
    }
}

# = Class: dovecot::protocol::imap
#
# Install dovecot imap protocol
#
# == Parameters:
#
# [* ensure *]
#   What state to ensure for the package. Accepts the same values
#   as the parameter of the same name for a package type.
#   Default: present
#

class dovecot::protocol::imap (
    $ensure = hiera('dovecot::protocol::imap::ensure', present),
) {
    dovecot::protocol { 'imap':
        ensure => $ensure,
    }
}

# = Class: dovecot::protocol::sieve
#
# Install dovecot sieve protocol
#
# == Parameters:
#
# [* ensure *]
#   What state to ensure for the package. Accepts the same values
#   as the parameter of the same name for a package type.
#   Default: present
#

class dovecot::protocol::sieve (
    $ensure = hiera('dovecot::protocol::sieve::ensure', present),
) {
    dovecot::protocol { 'sieve':
        ensure => $ensure,
    }
}

