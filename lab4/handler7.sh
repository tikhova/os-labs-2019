 #!/usr/bin/bash

echo $$ > .pid
A=1

trap 'let A=$A+2; echo $A' USR1
trap 'let A=$A*2; echo $A' USR2
trap 'echo "Stopped by SIGTERM"; exit' SIGTERM

while true; do
    sleep 1
done
