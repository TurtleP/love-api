local path = (...):match('(.-)[^%./]+$')

return {
    name = 'keyboard',
    description = 'Provides an interface to the user\'s keyboard.',
    types = {
    },
    functions = {
        {
            name = 'hasScreenKeyboard',
            description = 'Gets whether screen keyboard is supported.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'supported',
                            description = 'Whether screen keyboard is supported.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasTextInput',
            description = 'Gets whether text input events are enabled.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'Whether text input events are enabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'setTextInput',
            description = 'Enables the system\'s software keyboard.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether text input events should be enabled.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'The flags table with the options:',
                            table = {
                                {
                                    type = 'KeyboardType',
                                    name = 'type',
                                    description = 'Keyboard layout type.',
                                    default = 'normal',
                                },
                                {
                                    type = 'boolean',
                                    name = 'password',
                                    description = 'Hide the keyboard input after a delay.',
                                    default = 'false'
                                },
                                {
                                    type = 'string',
                                    name = 'hint',
                                    description = 'The hint of what the user should input.',
                                    default = ''
                                },
                                {
                                    type = 'integer',
                                    name = 'length',
                                    description = 'The maximum length of text the keyboard can input.',
                                    default = 20
                                }
                            },
                        }
                    }
                }
            },
        },
    },
    enums = {
        require(path .. 'enums.KeyboardType'),
    },
}
