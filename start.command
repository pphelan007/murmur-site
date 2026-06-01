#!/usr/bin/env bash
# Double-click this file to launch the Murmur marketing site locally.
# It installs dependencies on first run, frees port 4321, opens the browser, then runs the Astro dev server.

set -e
cd "$(dirname "$0")"

PORT=4321

# Make sure node + npm are on PATH for double-click launches (Finder uses a stripped env).
if ! command -v node >/dev/null 2>&1; then
  [ -d "/opt/homebrew/bin" ] && export PATH="/opt/homebrew/bin:$PATH"
  [ -d "/usr/local/bin"    ] && export PATH="/usr/local/bin:$PATH"
fi

if ! command -v node >/dev/null 2>&1; then
  echo ""
  echo "  Node.js isn't installed (or isn't on PATH)."
  echo "  Install it with:   brew install node"
  echo ""
  read -n 1 -s -r -p "Press any key to close this window…"
  exit 1
fi

# Free the port if anything else is bound to it
PID=$(lsof -ti tcp:$PORT 2>/dev/null || true)
if [ -n "$PID" ]; then
  echo "  (freeing port $PORT, killing PID $PID)"
  kill -9 $PID 2>/dev/null || true
  sleep 0.5
fi

if [ ! -d node_modules ]; then
  echo ""
  echo "  First run — installing dependencies…"
  npm install
fi

# Open the browser once the server is up
( sleep 2.2 && open "http://localhost:$PORT" ) &

echo ""
echo "  Starting Murmur site → http://localhost:$PORT"
echo "  Press Ctrl-C in this window to stop."
echo ""

exec npm run dev
