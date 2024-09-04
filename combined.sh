#!/bin/bash

# Define ports
HELLO_PORT=8081
WORLD_PORT=8082

# Start port forwarding in the background
kubectl port-forward service/hello-service $HELLO_PORT:$HELLO_PORT &
HELLO_PID=$!
kubectl port-forward service/world-service $WORLD_PORT:$WORLD_PORT &
WORLD_PID=$!

# Give some time for port forwarding to set up
sleep 5

# Define URLs
HELLO_URL="http://localhost:$HELLO_PORT/hello"
WORLD_URL="http://localhost:$WORLD_PORT/world"

# Test Hello Service
HELLO_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $HELLO_URL)
if [ "$HELLO_RESPONSE" -eq 200 ]; then
    echo "Hello Service is up and running!"
else
    echo "Hello Service is not reachable or returned an error. HTTP Status: $HELLO_RESPONSE"
    kill $HELLO_PID
    kill $WORLD_PID
    exit 1
fi

# Test World Service
WORLD_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $WORLD_URL)
if [ "$WORLD_RESPONSE" -eq 200 ]; then
    echo "World Service is up and running!"
else
    echo "World Service is not reachable or returned an error. HTTP Status: $WORLD_RESPONSE"
    kill $HELLO_PID
    kill $WORLD_PID
    exit 1
fi

# Print "Hello Service" if both services are running
echo "Hello Service"

# Clean up port forwarding
kill $HELLO_PID
kill $WORLD_PID
