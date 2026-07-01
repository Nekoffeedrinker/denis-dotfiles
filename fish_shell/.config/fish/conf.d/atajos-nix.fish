# ================================================
#     Alias y funciones útiles par nix
# ================================================

# Comparar generaciones de NixOS
function nvd-diff --description 'Compara dos generaciones del sistema con nvd'
    if test (count $argv) -ne 2
        echo "Uso: nvd-diff <gen_antigua> <gen_nueva>"
        return 1
    end

    nvd diff /nix/var/nix/profiles/system-$argv[1]-link /nix/var/nix/profiles/system-$argv[2]-link
end
# uso: 'nvd-diff 21 22'
# -----------------------
