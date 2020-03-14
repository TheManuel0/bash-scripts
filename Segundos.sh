#!/usr/bin/bash

echo "#### enter the full directory path to copy, followed to the one to be copied ####"
read a b
echo "#### enter parar cada X, Y segundosfollowed by the seconds in sequence it has to stop"
read c d
end=$((SECONDS+$d))
a1 () {
  f=$(stdbuf -oL -eL timeout --foreground --signal=2 $c rsync -avz --append $a $b)
}
a2 () {
  e=$(diff $a $b)
  if [ -z "$e" ]; then
    t=3
  fi
}
t=0
while [[ $t -ne 3 ]]; do
  if [ $t -eq 0 ]; then
    echo "Copying..."
    a1
    t=1
  elif [ $t -eq 1 ]; then
    clear
    echo "Stopping for "$d" seconds"
    echo $f
    sleep $end
    t=2
    a2
  elif [ $t -eq 2 ]; then
    echo "Resuming"
    a1
    t=1
    a2
  fi
done
