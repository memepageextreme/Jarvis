#!/bin/bash
# Deployment script for Jarvis AI Assistant Demo

set -e  # Exit on any error

echo "Jarvis AI Assistant Demo Deployment Script"
echo "=========================================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are installed"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the application (if needed)
echo "🔨 Building application..."

# Start the application
echo "🚀 Starting Jarvis AI Assistant Demo..."
echo "The demo will be available at http://localhost:3000"
echo "Press Ctrl+C to stop the server"
npm start