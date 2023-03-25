local path = (...):match('(.-)[^%./]+$')

return {
    name = 'window',
    description = 'Provides an interface for modifying and retrieving information about the program\'s window.',
    types = {
    },
    functions = {
        {
            name = 'getDisplayCount',
            description = 'Gets the number of connected monitors.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of currently connected displays.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFullscreenModes',
            description = 'Gets a list of supported fullscreen modes.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'displayindex',
                            description = 'The index of the display, if multiple monitors are available.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'modes',
                            description = 'A table of width/height pairs. (Note that this may not be in order.)',
                        },
                    },
                },
            },
        },
        {
            name = 'getIcon',
            description = 'Gets the window icon.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imagedata',
                            description = 'The window icon imagedata, or nil if no icon has been set with love.window.setIcon.',
                        },
                    },
                },
            },
        },
        {
            name = 'isOpen',
            description = 'Checks if the window is open.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'open',
                            description = 'True if the window is open, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMode',
            description = 'Sets the display mode and properties of the window.\n\nIf width or height is 0, setMode will use the width and height of the desktop. \n\nChanging the display mode may have side effects: for example, canvases will be cleared and values sent to shaders with canvases beforehand or re-draw to them afterward if you need to.',
            variants = {
                {
                    description = '* If fullscreen is enabled and the width or height is not supported (see resize event will be triggered.\n\n* If the fullscreen type is \'desktop\', then the window will be automatically resized to the desktop resolution.\n\n* If the width and height is bigger than or equal to the desktop dimensions (this includes setting both to 0) and fullscreen is set to false, it will appear \'visually\' fullscreen, but it\'s not true fullscreen and conf.lua (i.e. t.window = false) and use this function to manually create the window, then you must not call any other love.graphics.* function before this one. Doing so will result in undefined behavior and/or crashes because OpenGL cannot function properly without a window.\n\n* Transparent backgrounds are currently not supported.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Display width.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Display height.',
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'The flags table with the options:',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Fullscreen (true), or windowed (false).',
                                    default = 'false',
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fullscreentype',
                                    description = 'The type of fullscreen to use. This defaults to \'normal\' in 0.9.0 through 0.9.2 and to \'desktop\' in 0.10.0 and older.',
                                    default = '\'desktop\'',
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    description = 'True if LÖVE should wait for vsync, false otherwise.',
                                    default = 'true',
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The number of antialiasing samples.',
                                    default = '0',
                                },
                                {
                                    type = 'boolean',
                                    name = 'stencil',
                                    description = 'Whether a stencil buffer should be allocated. If true, the stencil buffer will have 8 bits.',
                                    default = 'true',
                                },
                                {
                                    type = 'number',
                                    name = 'depth',
                                    description = 'The number of bits in the depth buffer.',
                                    default = '0',
                                },
                                {
                                    type = 'boolean',
                                    name = 'resizable',
                                    description = 'True if the window should be resizable in windowed mode, false otherwise.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'borderless',
                                    description = 'True if the window should be borderless in windowed mode, false otherwise.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'centered',
                                    description = 'True if the window should be centered in windowed mode, false otherwise.',
                                    default = 'true',
                                },
                                {
                                    type = 'number',
                                    name = 'display',
                                    description = 'The index of the display to show the window in, if multiple monitors are available.',
                                    default = '1',
                                },
                                {
                                    type = 'number',
                                    name = 'minwidth',
                                    description = 'The minimum width of the window, if it\'s resizable. Cannot be less than 1.',
                                    default = '1',
                                },
                                {
                                    type = 'number',
                                    name = 'minheight',
                                    description = 'The minimum height of the window, if it\'s resizable. Cannot be less than 1.',
                                    default = '1',
                                },
                                {
                                    type = 'boolean',
                                    name = 'highdpi',
                                    description = 'True if high-dpi mode should be used on Retina displays in macOS and iOS. Does nothing on non-Retina displays.',
                                    default = 'false',
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-coordinate of the window\'s position in the specified display.',
                                    default = 'nil',
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-coordinate of the window\'s position in the specified display.',
                                    default = 'nil',
                                },
                                {
                                    type = 'boolean',
                                    name = 'usedpiscale',
                                    description = 'Disables automatic DPI scaling when false.',
                                    default = 'true',
                                },
                                {
                                    type = 'boolean',
                                    name = 'srgb',
                                    description = 'Removed in 0.10.0 (set t.gammacorrect in conf.lua instead). True if sRGB gamma correction should be applied when drawing to the screen.',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if successful, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'showMessageBox',
            description = 'Displays a message box dialog above the love window. The message box contains a title, optional text, and buttons.',
            variants = {
                {
                    description = 'Displays a simple message box with a single \'OK\' button.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The title of the message box.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'The text inside the message box.',
                        },
                        {
                            type = 'MessageBoxType',
                            name = 'type',
                            description = 'The type of the message box.',
                            default = '\'info\'',
                        },
                        {
                            type = 'boolean',
                            name = 'attachtowindow',
                            description = 'Whether the message box should be attached to the love window or free-floating.',
                            default = 'true',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the message box was successfully displayed.',
                        },
                    },
                },
                {
                    description = 'Displays a message box with a customized list of buttons.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The title of the message box.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'The text inside the message box.',
                        },
                        {
                            type = 'table',
                            name = 'buttonlist',
                            description = 'A table containing a list of button names to show. The table can also contain the fields enterbutton and escapebutton, which should be the index of the default button to use when the user presses \'enter\' or \'escape\', respectively.',
                        },
                        {
                            type = 'MessageBoxType',
                            name = 'type',
                            description = 'The type of the message box.',
                            default = '\'info\'',
                        },
                        {
                            type = 'boolean',
                            name = 'attachtowindow',
                            description = 'Whether the message box should be attached to the love window or free-floating.',
                            default = 'true',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'pressedbutton',
                            description = 'The index of the button pressed by the user. May be 0 if the message box dialog was closed without pressing a button.',
                        },
                    },
                },
            },
        }
    },
    enums = {
        require(path .. 'enums.FullscreenType'),
        require(path .. 'enums.MessageBoxType'),
    },
}
