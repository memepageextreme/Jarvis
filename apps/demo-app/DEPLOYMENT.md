# Deploying Jarvis Demo for Friends/Family

This guide explains how to deploy the Jarvis AI Assistant demo so friends and family can test it.

## Option 1: Local Network Sharing

If you want to share with people on the same network:

1. Run the demo server:
   ```bash
   cd apps/demo-app
   npm install
   npm start
   ```

2. Share your local IP address with friends/family
3. They can access it at `http://YOUR_IP_ADDRESS:3000`

## Option 2: Public Deployment with ngrok (Temporary)

For temporary public access:

1. Install ngrok from https://ngrok.com/
2. Start the demo server:
   ```bash
   cd apps/demo-app
   npm install
   npm start
   ```
3. In another terminal, run:
   ```bash
   ngrok http 3000
   ```
4. Share the ngrok URL with friends/family

## Option 3: Cloud Deployment

For longer-term access, deploy to a cloud platform:

### Heroku Deployment

1. Install Heroku CLI
2. Login to Heroku:
   ```bash
   heroku login
   ```
3. Create a new app:
   ```bash
   heroku create your-jarvis-demo-app
   ```
4. Deploy:
   ```bash
   git add .
   git commit -m "Prepare for Heroku deployment"
   git push heroku main
   ```

### Railway Deployment

1. Install Railway CLI or use the web interface
2. Create a new project
3. Connect to your GitHub repository
4. Deploy the `apps/demo-app` directory

### Vercel/Netlify Deployment

For static hosting (without backend API):
1. Build a static version
2. Deploy to Vercel or Netlify
3. Note: This won't connect to a real backend

## Option 4: Connecting to Real Backend

To connect this demo to a real Clawdbot instance:

1. Deploy your Clawdbot instance
2. Enable the API endpoints
3. Update `index.html` to connect to your backend API
4. Add authentication as needed

## Security Considerations

When sharing publicly:
- Don't expose real API keys in client code
- Implement proper authentication
- Use HTTPS
- Limit request rates
- Monitor usage

## Customization

You can customize the demo by:
- Modifying the UI in `index.html`
- Adding new features in the JavaScript
- Changing the simulated responses
- Connecting to a real backend