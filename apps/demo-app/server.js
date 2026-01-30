const express = require('express');
const path = require('path');
const os = require('os');
const app = express();
const PORT = process.env.PORT || 3000;

// Get the local IP address
function getLocalIP() {
    const interfaces = os.networkInterfaces();
    for (const interfaceName in interfaces) {
        const interface = interfaces[interfaceName];
        for (const config of interface) {
            if (!config.internal && config.family === 'IPv4') {
                return config.address;
            }
        }
    }
    return 'localhost';
}

const localIP = getLocalIP();

// Serve static files from the current directory
app.use(express.static(path.join(__dirname)));

// Route for the main page
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Simple API endpoint for testing
app.get('/api/status', (req, res) => {
    res.json({ 
        status: 'online',
        message: 'Jarvis Demo API is running',
        timestamp: new Date().toISOString(),
        localIP: localIP
    });
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Jarvis AI Assistant demo server running on http://${localIP}:${PORT}`);
    console.log('Server is accessible from other devices on the same network');
    console.log('Press Ctrl+C to stop the server');
});