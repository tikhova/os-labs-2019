 #!/usr/bin/bash

x=1
while true;
do
    x=$(bc -l <<< $x/42)
done
