# = Define: dovecot::config
#
# Create dovecot config file snippet

define dovecot::config (
    $ensure  = present,
    $content = undef,
    $source  = undef,
) {
    require dovecot

    file { "${dovecot::config_dir_d}/${name}.conf":
        ensure  => $ensure,
        content => $content,
        source  => $source,
        notify  => Service[dovecot],
    }
}

