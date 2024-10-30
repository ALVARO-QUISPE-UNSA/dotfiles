Lo que tienes que hacer es
ejecutar este script:
le pones el nombre que desees en target pane

luego con el otro script te mandará la cadena de texto a ese panel y puede ejecutar cualquier comando ahí

```bash
    tmux select-pane -t [pane_id] -T "target_panel"
```

```bash
#!/bin/bash
# Script: execute_in_panel.sh

# Busca el ID del panel que tiene el nombre "target_panel"
target_pane=$(tmux list-panes -a -F "#{pane_id} #{pane_title}" | grep "target_panel" | awk '{print $1}')

# Verifica si el panel existe, y si es así, ejecuta el comando

if [ -n "$target_pane" ]; then
    if [ "$1" == "-compile" ]; then
        tmux send-keys -t "$target_pane" "g++ -g $2 -o ${2%.cpp}.out" C-m
    else 
        tmux send-keys -t "$target_pane" "./${1%.cpp}.out" C-m
    fi
else
    echo "Panel con nombre 'target_panel' no encontrado."
fi
```
