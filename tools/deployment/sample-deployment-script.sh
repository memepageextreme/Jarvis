#!/bin/bash
# Sample deployment script for a new client instance

echo "Setting up new client instance..."
CLIENT_NAME=$1
if [ -z "$CLIENT_NAME" ]; then
    echo "Usage: $0 <client_name>"
    exit 1
fi

# Create client directory
mkdir -p "/home/vladx/clients/$CLIENT_NAME"
cd "/home/vladx/clients/$CLIENT_NAME"

# Initialize with basic configuration
cat > client-config.json << EOF
{
  "client_name": "$CLIENT_NAME",
  "workspace": "/home/vladx/clients/$CLIENT_NAME/workspace",
  "ai_provider": "qwen-portal",
  "communication_channels": ["whatsapp"],
  "features_enabled": ["basic_assistant", "calendar", "web_search"]
}
EOF

echo "Client $CLIENT_NAME initialized in /home/vladx/clients/$CLIENT_NAME"
echo "Configuration created: client-config.json"