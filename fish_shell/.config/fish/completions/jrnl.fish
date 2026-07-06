# Completions for jrnl (https://jrnl.sh)
# Traducido del completions de zsh (zsh-users/zsh-completions: _jrnl)
# y de la referencia oficial reference-command-line.md

# --- Comandos independientes (no toman argumento) ---
complete -c jrnl -l help        -f -d 'Show help message'
complete -c jrnl -l version     -f -d 'Print version and license information'
complete -c jrnl -l list        -f -d 'List config file location, journals, and their locations'
complete -c jrnl -l encrypt     -f -d 'Encrypt a journal'
complete -c jrnl -l decrypt     -f -d 'Decrypt selected journal and store it in plain text'
complete -c jrnl -l debug       -f -d 'Print information useful for troubleshooting'
complete -c jrnl -l diagnostic  -f -d 'Print diagnostic information for reporting issues'

# --- Import ---
complete -c jrnl -l import      -f -d 'Import entries from another journal'
complete -c jrnl -l file        -r -d 'Specify a file to import/export'
# --format también se usa aquí para especificar el formato de importación (ver más abajo)

# --- Edición / borrado ---
complete -c jrnl -l edit        -f -d 'Opens the selected entries in your configured editor'
complete -c jrnl -l delete      -f -d 'Interactively deletes selected entries'
complete -c jrnl -l change-time -r -d 'Change timestamp for selected entries (default: now)'

# --- Formato de salida ---
complete -c jrnl -l format -x -a "json markdown yaml text tags fancy short" -d 'Display selected entries in an alternate format'
complete -c jrnl -l tags   -f -d 'Alias for --format tags'
complete -c jrnl -l short  -f -d 'Show only titles or line containing the search tags'

# --- Configuración ---
complete -c jrnl -l config-override -x -d 'Override configured key-value pair'
complete -c jrnl -l config-file     -r -d 'Override default config file'

# --- Búsqueda: opciones "old-style" (un solo guion, no combinables) ---
complete -c jrnl -o on                -r -d 'Show entries on this date'
complete -c jrnl -o today-in-history  -f -d 'Show entries of today over the years'
complete -c jrnl -o month             -r -d 'Show entries on this month of any year'
complete -c jrnl -o day               -r -d 'Show entries on this day of any month'
complete -c jrnl -o year              -r -d 'Show entries of a specific year'
complete -c jrnl -o from              -r -d 'Show entries after, or on, this date'
complete -c jrnl -o to                -r -d 'Show entries before, or on, this date'
complete -c jrnl -o until             -r -d 'Alias of -to'
complete -c jrnl -o contains          -r -d 'Show entries containing specific text'
complete -c jrnl -o and               -f -d 'Show only entries that match all conditions (default: OR)'
complete -c jrnl -o starred           -f -d 'Show only starred entries'
complete -c jrnl -o tagged            -f -d 'Show only entries that have at least one tag'
complete -c jrnl -o n                 -r -d 'Show a maximum of NUMBER entries'
complete -c jrnl -o not               -x -a "starred tagged" -d 'Exclude entries with that tag (or -starred / -tagged)'
