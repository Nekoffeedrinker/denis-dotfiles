# Abrir aplicaciones GTK3 siempre en modo oscuro

En entornos de escritorio minimistas no existen los elementos para que las apps
gtk3 sigan el tema del sistema (ya sea claro u oscuro), por lo que se tienen que
buscar métodos alternativos.

Como es muy complicado hacer que sigan el modo del sistema, lo mejor es
enfocarse en que abran en el tema de nuestra elección. Yo prefiero el oscuro, ya
que el tema claro es molesto en la noche; pero el oscuro no es molesto en el
día.

A continuación, dos métodos para llegar a este objetivo.

## Modificar .desktops

En esta carpeta están dos archivos `.desktop` modificados para poder ejecutar
sus aplicaciones en modo oscuro. La forma en la que lo hacen es aplicarles una
variable en el entorno en el que se va a ejecutar, cambiando así el tema que van
a utilizar.

Ejemplo:
```
Exec=env GTK_THEME=Adwaita:dark virt-manager
```

Y esto puede aplicar para cualquier app _que **no** use privilegios de root_.

En mi caso solo hice archivos para **Meld** y **Virt-manager**, pero se puede
aplicar para cualquier aplicación. Lo único que hay que hacer es ponerlas en
`~/.local/share/applications/`, que en mi caso se hace por medio de simlinks de
Stow.

## Crear un settings.ini para el usuario root

Debido al funcionamiento de apps como **GParted**, no es posible pasarles
variables de entorno para que se muestren en modo oscuro. Esto es porque al
solicitar los permisos, no heredan las opciones que tenían como apps normales.

La solución es crear el archivo `settings.ini` en el directorio GTK3 de root:

```bash
sudo mkdir -p /root/.config/gtk-3.0
echo -e '[Settings]\ngtk-application-prefer-dark-theme=1' | sudo tee /root/.config/gtk-3.0/settings.ini
```

La razón por la que esto funciona es por cómo estas aplicaciones leen las
preferencias de tema. GTK3 busca la preferncia de tema dentro del
`.config/gtk-3.0/settings.ini` del usuario que ejecuta el proceso.

GParted siempre se ejecuta como root, así que gtk3 busca la preferencia en
`/root/.config/gtk-3.0/settings.ini`.

### consideraciones

- Esto aplica a cualquier app GTK3 que escale privilegios con `pkexec` o `sudo`.
- No requiere reiniciar el sistema, solo volver a abrir la app.
- En NixOS el archivo `/root/.config/` **no** es gestionado por el sistema declarativo,
  así que este cambio persiste entre rebuilds sin necesidad de declararlo en ningún `.nix`.
