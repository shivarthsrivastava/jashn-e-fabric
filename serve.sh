#!/bin/bash

# Simple script to serve the web build locally

PORT=${1:-8000}

echo "Starting web server on port $PORT..."
echo "Open http://localhost:$PORT in your browser"
echo "Press Ctrl+C to stop the server"
echo ""

# Try Python 3 first, then Python 2, then suggest alternatives
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT
elif command -v python &> /dev/null; then
    python -m SimpleHTTPServer $PORT
else
    echo "Python not found. Please install Python or use:"
    echo "  npx http-server -p $PORT"
    exit 1
fi

