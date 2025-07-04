if pgrep "kmag" >/dev/null; then
  pkill kmag
else
  nohup kmag >/dev/null 2>&1 &
fi
