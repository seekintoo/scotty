%environment = (
    time_zone   => 'America/Denver',
    # server name of the SCOT server
    servername  => 'scot-dev',
    # username with sufficient scot perms to create alert(groups)
    username    => 'scot-alerts',
    # the password for that user
    password    => 'changemenow',
    # authentication type: RemoteUser, LDAP, Local
    authtype    => 'Local',
    # interactive
    interactive => 0,
    # max workers
    max_workers => 20,
    # log config
    log_config  => {
        logger_name     => 'SCOT',
        layout          => '%d %7p [%P] %15F{1}: %4L %m%n',
        appender_name   => 'scot_log',
        logfile         => './logs/reflair.log',
        log_level       => 'DEBUG',
    },
    stomp_host  => "192.168.49.2",
    stomp_port  => 32688,
    topic       => "/topic/scot",
    # modules used by flair app
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
        {
            attr    => 'mq',
            class   => 'Scot::Util::Messageq',
            config  => {
                destination => "scot",
                stomp_host  => "192.168.49.2",
                stomp_port  => 32688,
            },
        },
        {
            attr    => 'es',
            class   => 'Scot::Util::ElasticSearch',
            config  => {
                nodes       => [ qw(https://admin:admin@192.168.49.2:32006) ],
                max_workers => 1,
            },
        },
    ],
    # future use:
    location                => "scot_demo",
    site_identifier         => "scot_demo",
    default_share_policy    => "none",
);
