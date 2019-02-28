#!/usr/bin/bash
warning="Warning: "
information=" Information: "
wwPattern="\[.*\][[:space:]]\(WW\)"
iiPattern="\[.*\][[:space:]]\(II\)"
ww="(WW)"
ii="(II)"
grep -E -a $wwPattern /var/log/Xorg.0.log | sed "s/$ww/$warning/" > full.log
grep -E -a $iiPattern /var/log/Xorg.0.log | sed "s/$ii/$information/" >> full.log
cat full.log
