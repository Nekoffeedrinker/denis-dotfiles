function fixVideo-rotar
    for archivo in $argv
        set nombre (basename $archivo)
        set extension (string split -r -m1 . $nombre)[2]
        set base (string split -r -m1 . $nombre)[1]
        set salida "$base-90.$extension"

        echo "Procesando: $archivo -> $salida"
        ffmpeg -display_rotation -90 -i $archivo -c copy $salida
    end
end
