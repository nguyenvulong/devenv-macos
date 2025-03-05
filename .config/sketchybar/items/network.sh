COLOR="$TEAL"

sketchybar --add item ip_address right \
  --set ip_address script="$PLUGIN_DIR/network.sh" \
  update_freq=30 \
  background.padding_left=0 \
  background.padding_right=5 \
  icon.padding_left=10 \
  label.padding_right=10 \
  background.corner_radius="$CORNER_RADIUS" \
  background.border_width="$BORDER_WIDTH" \
  background.border_color="$COLOR" \
  background.color="$BAR_COLOR" \
  background.drawing=on \
  background.height=26 \
  icon.color="$COLOR" \
  label.color="$COLOR" \
  --subscribe ip_address wifi_change
