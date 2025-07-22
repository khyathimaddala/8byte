8byte - Application Setup
Overview
This project sets up a visually appealing 3D portfolio website using Three.js, featuring a rotating 3D cube and an animated text overlay displaying "Hey, Hi 8byte- This is Khyathi Maddala." The application delivers a modern, engaging UI with a "wow" factor, as requested in the assignment.
Prerequisites

Git: Install from git-scm.com.
Node.js: Install via nvm in WSL (github.com/nvm-sh/nvm) for Unix compatibility.
GitHub Account: Create at github.com.
Text Editor: VS Code recommended (code.visualstudio.com).

Setup Instructions

Clone the Repository:git clone https://github.com/khyathimaddala/8byte.git
cd 8byte

Test the Application Locally:npm install -g http-server
http-server

Open http://localhost:8080 in your browser to see the 3D portfolio.
Stop the Server:Press Ctrl+C in the terminal.

Application Details

Technology: Uses Three.js (via CDN) for 3D rendering.
UI Features:
Rotating neon-green wireframe cube for a modern 3D effect.
Animated text ("Hey, hi 8bytes - this is Khyathi Maddala") with pulsing effect and glowing shadow.
Dark background for visual contrast.


Responsiveness: Adjusts to window size changes.

Best Practices

Modern UI: Three.js and CSS animations for an engaging experience.
Lightweight: CDN for Three.js avoids local dependencies.
Version Control: Clear commit messages for traceability.
Responsive Design: Window resize handling for consistent rendering.

Challenges and Resolutions

Challenge: bash\r error in npm due to Windows-style line endings in WSL.
Resolution: Installed Node.js v16 via nvm in WSL for Unix-compatible files.


Challenge: http-server permissions issue.
Resolution: Installed with sudo.


Challenge: Three.js compatibility.
Resolution: Used stable version (r134) via CDN, tested on Chrome.

# 8byte
