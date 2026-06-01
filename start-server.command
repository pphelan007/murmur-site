#!/bin/bash
# Murmur site — local dev server
cd "$(dirname "$0")"
PORT=4321

echo ""
echo "  Starting Murmur site on http://localhost:$PORT"
echo "  (press Ctrl+C to stop)"
echo ""

# Free the port if anything else is bound to it
PID=$(lsof -ti tcp:$PORT 2>/dev/null)
if [ -n "$PID" ]; then
  echo "  (killing existing process on port $PORT: $PID)"
  kill -9 $PID 2>/dev/null
  sleep 0.5
fi

# Launch the browser after a short delay so the server is up
( sleep 1.2 && open "http://localhost:$PORT" ) &

# Serve. -d ensures we serve from this folder regardless of cwd quirks.
exec python3 -m http.server $PORT --bind 127.0.0.1
