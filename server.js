const express = require('express');
const os = require('os');
const app = express();
const PORT = process.env.PORT || 80;

// ডকার বিল্ডের সময় পাস করা গিট হাশ এনভায়রনমেন্ট ভ্যারিয়েবল থেকে নেওয়া হচ্ছে
const COMMIT_HASH = process.env.GIT_COMMIT_HASH || 'Local / Not Provided';

app.get('/', (req, res) => {
    const hostname = os.hostname();

    res.send(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>VM Deployment App Latest</title>
            <style>
                body { font-family: Arial, sans-serif; background: #f0f2f5; text-align: center; padding-top: 60px; }
                .card { background: white; max-width: 450px; margin: auto; padding: 30px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
                h1 { color: #333; }
                .info { font-size: 16px; margin: 20px 0; background: #eef2f7; padding: 12px; border-radius: 6px; text-align: left; }
                span { font-weight: bold; color: #0066cc; word-break: break-all; }
            </style>
        </head>
        <body>
            <div class="card">
                <h1>🚀 New App Deployed Successfully!</h1>
                <div class="info">VM Hostname: <br><span>${hostname}</span></div>
                <div class="info">Git Commit Hash: <br><span>${COMMIT_HASH}</span></div>
            </div>
        </body>
        </html>
    `);
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});