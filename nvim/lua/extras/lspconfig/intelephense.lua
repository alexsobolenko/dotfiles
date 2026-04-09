-- extra config for lsp intelephense

local function get_php_version_from_composer()
    local file = io.open("composer.json", "r")
    if not file then
        return nil
    end

    local content = file:read("*a")
    file:close()

    return content:match('"php"%s*:%s*"[><=%^~]*%s*(%d+%.%d+)')
end

return {
    flags = {
        debounce_text_changes = 150,
    },
    filetypes = {
        "php",
        "twig",
    },
    settings = {
        intelephense = {
            environment = {
                phpVersion = get_php_version_from_composer() or "7.4",
            },
            files = {
                maxSize = 5000000,
            },
            diagnostics = {
                enable = true,
            },
            stubs = {
                "Core",
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com",
                "ctype",
                "curl",
                "date",
                "dom",
                "exif",
                "fileinfo",
                "filter",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "intl",
                "json",
                "libxml",
                "mbstring",
                "mysqli",
                "mysqlnd",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "redis",
                "Reflection",
                "session",
                "SimpleXML",
                "sockets",
                "sodium",
                "SOAP",
                "sqlite3",
                "standard",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
            },
        },
    },
}
