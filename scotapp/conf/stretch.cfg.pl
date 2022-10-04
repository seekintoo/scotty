%environment = (
    time_zone   => 'America/Denver',
    max_workers => 1,
    log_config  => {
        logger_name     => 'SCOT',
        layout          => '%d %7p [%P] %15F{1}: %4L %m%n',
        appender_name   => 'scot_log',
        logfile         => './logs/stretch.log',
        log_level       => 'DEBUG',
    },
    max_workers     => 2,
    stomp_host  => "192.168.49.2",
    stomp_port  => 32688,
    topic       => "/topic/scot",
    default_owner   => 'scot-admin',
    modules => [
        {
            attr    => 'es',
            class   => 'Scot::Util::ElasticSearch',
            config  => {
                nodes   => [ qw(https://admin:admin@192.168.49.2:32006) ],
            },
        },
        {
            attr    => 'scot',
            class   => 'Scot::Util::ScotClient',
            config  => {
                servername  => "scot-dev",
                username    => "scot-alerts",
                password    => "changemenow",
                auth_type    => "Local",
            },
        },
        {
            attr    => 'mongo',
            class   => 'Scot::Util::MongoFactory',
            config  => {
                db_name         => 'scot-prod',
                host            => 'mongodb://mongoadmin:mongoadmin@192.168.49.2:30484/scot-prod?authSource=admin',
                write_safety    => 1,
                find_master     => 1,
            },
        },
    ],
    # future use:
    location                => "scot_demo",
    site_identifier         => "scot_demo",
    default_share_policy    => "none",
);
