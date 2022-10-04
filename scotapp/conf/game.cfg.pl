%environment = (
    location => "local",
    log_config  => {
        logger_name     => 'SCOT',
        layout          => '%d %7p [%P] %15F{1}: %4L %m%n',
        appender_name   => 'scot_log',
        logfile         => './logs/game.log',
        log_level       => 'DEBUG',
    },
    days_ago    => 30,
    modules => [
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
);
