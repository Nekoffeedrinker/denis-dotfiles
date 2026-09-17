function checkdeps --description 'Checa dependencias de pkg-config y binarios'
    set -l pc_deps
    set -l bin_deps
    set -l mode pc

    for arg in $argv
        switch $arg
            case '--bin'
                set mode bin
            case '--pc'
                set mode pc
            case '*'
                if test $mode = pc
                    set -a pc_deps $arg
                else
                    set -a bin_deps $arg
                end
        end
    end

    for pkg in $pc_deps
        if pkg-config --exists $pkg 2>/dev/null
            echo "✓ $pkg ("(pkg-config --modversion $pkg)")"
        else
            echo "✗ $pkg"
        end
    end

    for bin in $bin_deps
        if command -v $bin >/dev/null 2>&1
            echo "✓ $bin ("(command -v $bin)")"
        else
            echo "✗ $bin"
        end
    end
end
