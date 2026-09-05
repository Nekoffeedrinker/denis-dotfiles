function fixVideo-iphone60fps
        for archivo in $argv
                set nombre (basename $archivo)
                set extension (string split -r -m1 . $nombre)[2]
                set base (string split -r -m1 . $nombre)[1]
                set salida "$base-60fps.mp4"

                echo "Procesando: $archivo -> $salida"
                ffmpeg -i $archivo -vf fps=60 -c:v libx264 -preset medium -crf 16 -pix_fmt yuv420p -c:a aac -b:a 192k $salida
        end
end
