#!/bin/bash
# Production-ready deployment script for new clients
# Usage: ./deploy-client.sh <client_name> <client_email> [features]

set -e  # Exit on any error

CLIENT_NAME=$1
CLIENT_EMAIL=$2
FEATURES=${3:-"basic"}

if [ -z "$CLIENT_NAME" ] || [ -z "$CLIENT_EMAIL" ]; then
    echo "Usage: $0 <client_name> <client_email> [features]"
    echo "Features: basic, business, enterprise"
    exit 1
fi

echo "Deploying AI assistant for: $CLIENT_NAME <$CLIENT_EMAIL>"

# Validate client name (only alphanumeric and underscores)
if [[ ! "$CLIENT_NAME" =~ ^[a-zA-Z0-9_]+$ ]]; then
    echo "Error: Client name can only contain letters, numbers, and underscores"
    exit 1
fi

# Create client workspace
CLIENT_DIR="/home/vladx/clients/$CLIENT_NAME"
mkdir -p "$CLIENT_DIR/workspace/memory"

# Create configuration based on features
case $FEATURES in
    "enterprise")
        FEATURES_JSON='["basic_assistant", "calendar", "web_search", "files", "automation", "analytics", "custom_integrations"]'
        ;;
    "business")
        FEATURES_JSON='["basic_assistant", "calendar", "web_search", "files", "automation"]'
        ;;
    *)
        FEATURES_JSON='["basic_assistant", "calendar", "web_search"]'
        ;;
esac

# Create client configuration
cat > "$CLIENT_DIR/client-config.json" << EOF
{
  "client_name": "$CLIENT_NAME",
  "client_email": "$CLIENT_EMAIL",
  "workspace": "$CLIENT_DIR/workspace",
  "ai_provider": "qwen-portal",
  "communication_channels": ["whatsapp"],
  "features_enabled": $FEATURES_JSON,
  "deployment_date": "$(date -Iseconds)",
  "status": "active"
}
EOF

# Create README for client
cat > "$CLIENT_DIR/README.md" << EOF
# $CLIENT_NAME - AI Assistant

Welcome to your personal AI assistant!

## Access
- WhatsApp: Link your business WhatsApp to communicate with your assistant
- Web Interface: Available at [generated URL]

## Features
$(echo $FEATURES_JSON | sed 's/\[//g' | sed 's/\]//g' | sed 's/"//g' | tr ',' '\n' | sed 's/^ *//' | sed 's/ *$//' | sed 's/^/- /')

## Support
Contact support at [support contact information]

## Getting Started
1. Review your configuration in client-config.json
2. Customize your assistant settings
3. Begin using your AI assistant!

Last updated: $(date)
EOF

echo "✅ Client $CLIENT_NAME successfully deployed!"
echo "📁 Directory: $CLIENT_DIR"
echo "📋 Configuration: $CLIENT_DIR/client-config.json"
echo "📄 Instructions: $CLIENT_DIR/README.md"

# Optional: Send welcome notification to client
echo "📧 Welcome email would be sent to: $CLIENT_EMAIL"