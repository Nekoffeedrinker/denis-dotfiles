function contarAgrupados
    read -P "Extensiones [en minúsculas, separadas por espacio, ej: mp4 md]: " -l ext_input
    read -P "Patrón en común [prefijo, ej: `hemis(` ]: " -l prefix
    read -P "Separador entre grupo y nombre [vacío si no hay]: " -l sep

    set -l exts (string split ' ' -- "$ext_input")

    if test -z "$exts"
        echo 'Debes indicar al menos una extensión.' >&2
        return 1
    else if test -z "$prefix"
        echo 'Debes indicar el patrón en común.' >&2
        return 1
    end

    set -l exts_lower (string lower -- $exts)
    set -l prefix_pat "$prefix*"
    set -l bt '`'
    set -l rows

    for f in *
        test -f "$f"; or continue
        string match -q '*.*' -- "$f"; or continue

        set -l ext_raw (string replace -r '^.*\.' -- '' "$f")
        set -l ext (string lower -- "$ext_raw")
        contains -- $ext $exts_lower; or continue

        string match -q -- "$prefix_pat" "$f"; or continue

        set -l name (string replace -r '\.[^.]*$' -- '' "$f")
        set -l rest (string replace -- "$prefix" '' "$name")

        set -l group ''
        set -l clip ''
        if test -z "$sep"
            set group "$rest"
        else
            set -l parts (string split -m1 -- "$sep" "$rest")
            set group $parts[1]
            set clip $parts[2]
        end

        test -n "$group"; or continue

        set -a rows "$group|$clip|$ext_raw"
    end

    if test (count $rows) -eq 0
        echo 'Sin coincidencias.' >&2
        return 1
    end

    set -l sorted (printf '%s\n' $rows | sort)

    # Conteo por grupo (comparación literal, sin glob, para evitar
    # problemas con paréntesis u otros caracteres especiales en $group)
    set -l group_names
    set -l group_counts
    for row in $sorted
        set -l group (string split -m1 -- '|' "$row")[1]
        set -l idx (contains -i -- "$group" $group_names)
        if test -n "$idx"
            set group_counts[$idx] (math $group_counts[$idx] + 1)
        else
            set -a group_names "$group"
            set -a group_counts 1
        end
    end

    set -l prev ''
    for row in $sorted
        set -l parts (string split -m1 -- '|' "$row")
        set -l group $parts[1]
        set -l rest $parts[2]
        set -l clip_parts (string split -m1 -- '|' "$rest")
        set -l clip $clip_parts[1]
        set -l ext $clip_parts[2]

        if test "$group" != "$prev"
            test -n "$prev"; and echo ''
            set -l idx (contains -i -- "$group" $group_names)
            echo "**$prefix$group$sep** ($group_counts[$idx] elementos)"
            set prev "$group"
        end

        echo "- $bt$clip.$ext$bt"
    end
end
