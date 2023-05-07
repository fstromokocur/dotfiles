#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

# load colors
. ~/.config/chadwm/scripts/bar_themes/onedark

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

mem() {
  printf "^c$black^^b$blue^ MEM"
  printf "^c$white^ ^b$grey^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

clock() {
	printf "^c$black^ ^b$darkblue^ DATE "
	printf "^c$black^^b$blue^ $(date '+%a, %d.%m.%Y - %H:%M')  "
}

while true; do

  sleep 1 && xsetroot -name "$updates $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
done
