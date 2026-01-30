#!/bin/bash
# Main deployment orchestrator
# This script coordinates the overall deployment process

echo "Jarvis AI Assistant - Deployment Orchestrator"
echo "============================================="

case "${1:-menu}" in
    "new-client")
        if [ $# -ne 3 ]; then
            echo "Usage: $0 new-client <client_name> <email>"
            exit 1
        fi
        echo "Creating new client: $2"
        ./tools/deployment/deploy-client.sh "$2" "$3"
        ;;
    "status")
        echo "Checking deployment status..."
        if command -v docker &> /dev/null; then
            docker ps
        else
            echo "Docker not found, checking running processes..."
            ps aux | grep clawdbot
        fi
        ;;
    "menu"|*)
        echo "Available commands:"
        echo "  $0 new-client <name> <email>    - Deploy new client instance"
        echo "  $0 status                       - Check deployment status"
        echo "  $0 help                         - Show this help"
        ;;
esac