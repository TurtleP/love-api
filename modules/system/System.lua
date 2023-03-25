local path = (...):match('(.-)[^%./]+$')

return {
    name = 'system',
    description = 'Provides access to information about the user\'s system.',
    types = {
    },
    functions = {
        {
            name = 'getOS',
            description = 'Gets the current operating system. In general, LÖVE abstracts away the need to know the current operating system, but there are a few cases where it can be useful (especially in combination with os.execute.)',
            variants = {
                {
                    description = 'In LÖVE version 0.8.0, the \'\'\'love._os\'\'\' string contains the current operating system.',
                    returns = {
                        {
                            type = 'string',
                            name = 'osString',
                            description = 'The current operating system. \'Horizon\' or \'Cafe\'.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPowerInfo',
            description = 'Gets information about the system\'s power supply.',
            variants = {
                {
                    returns = {
                        {
                            type = 'PowerState',
                            name = 'state',
                            description = 'The basic state of the power supply.',
                        },
                        {
                            type = 'number',
                            name = 'percent',
                            description = 'Percentage of battery life left, between 0 and 100. nil if the value can\'t be determined or there\'s no battery.',
                        },
                        {
                            type = 'number',
                            name = 'seconds',
                            description = 'Seconds of battery life left. nil if the value can\'t be determined or there\'s no battery.',
                        },
                    },
                },
            },
        },
        {
            name = 'getProcessorCount',
            description = 'Gets the amount of logical processor in the system.',
            variants = {
                {
                    description = 'The number includes the threads reported if technologies such as Intel\'s Hyper-threading are enabled. For example, on a 4-core CPU with Hyper-threading, this function will return 8.',
                    returns = {
                        {
                            type = 'number',
                            name = 'processorCount',
                            description = 'Amount of logical processors.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.PowerState'),
    },
}
