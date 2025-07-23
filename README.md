------------------------------------8byte - Application Setup-----------------------------------------------
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

#######################################################################################

--------------------------------------8byte Infrastructure Deployment---------------------------------------------


This repository contains the Terraform configuration and supporting files for deploying a web application infrastructure on AWS, including an EC2 instance, Application Load Balancer (ALB), and S3 bucket. This README documents the process, challenges, and solutions encountered during the deployment and subsequent Git management.
Project Overview
The goal was to set up a scalable infrastructure for a web application named "8bytes Application" using Terraform, with an ALB for load balancing, an EC2 instance to serve the application, and an S3 bucket for static content hosting. The deployment was completed on July 23, 2025, meeting a tight deadline.
Deployment Process

Initial Infrastructure Setup:

Configured Terraform files to create a VPC, subnets, internet gateway, route tables, security groups, an EC2 instance, ALB, and an S3 bucket.
The index.html file was uploaded to the S3 bucket and served via the EC2 instance through user data scripts.


Terraform Apply Execution:

Ran terraform apply to provision resources, encountering initial errors due to insufficient IAM permissions (e.g., 403 UnauthorizedOperation for ec2:DeleteSubnet, elasticloadbalancing:DeleteTargetGroup, and s3:DeleteBucket).
Updated the IAM policy for the 8byte user to include necessary actions, resolving permission issues.


AMI and Policy Challenges:

Faced an invalid AMI ID (ami-0c55b159cbfafe1f0) error, which was fixed by implementing a dynamic data.aws_ami source to fetch the latest Amazon Linux 2 AMI.
Encountered a 403 Access Denied error when applying an S3 bucket policy due to Block Public Access settings. Added an aws_s3_bucket_public_access_block resource to disable these settings, ensuring the public policy was applied successfully.


Final Verification:

Obtained outputs: alb_dns_name = "8byte-alb-dev-1106071171.us-east-1.elb.amazonaws.com" and s3_bucket_name = "8byte-static-dev-2027ceja".
Verified the deployment by accessing the ALB DNS and S3 URL, confirming the "8bytes Application" page was live.



Git Management and Challenges
After deployment, pushing changes to GitHub faced significant hurdles:

Large File Issue: The Terraform provider file (terraform-provider-aws_v6.4.0_x5, 702.97 MB) exceeded GitHub’s 100 MB limit, causing push failures with a "pre-receive hook declined" error.
Solution: Added .terraform/ to .gitignore to exclude it from Git. Attempted to remove the large file from history using git filter-branch from the toplevel directory, followed by a force push. Initially ran into issues due to executing commands from the wrong directory, which was corrected by navigating to the repository root (~/8byte-task/8byte/).
Outcome: Successfully rewrote history, removed the large file locally, and forced a clean push to https://github.com/khyathimaddala/8byte.git, ensuring compliance with GitHub’s limits.

Challenges and Solutions

Permission Errors: Multiple 403 errors during terraform apply were overcome by iteratively updating the IAM policy to include all required actions (e.g., ec2:*, elasticloadbalancing:*, s3:*).
Invalid AMI: The hardcoded AMI issue was resolved by using a dynamic data source, ensuring compatibility with the us-east-1 region.
S3 Policy Conflict: The Block Public Access restriction was addressed by adding a public access block resource with appropriate settings.
Git Push Failures: The large file problem was tackled by removing it from Git history and enforcing proper .gitignore usage, requiring careful directory navigation and history rewriting.

Best Practices and Lessons Learned

Always include .terraform/ in .gitignore to avoid committing large provider files.
Use dynamic data sources (e.g., data.aws_ami) for region-specific resources like AMIs to enhance portability.
Test IAM permissions incrementally to catch issues early.
Run Git commands from the toplevel directory when modifying history to ensure consistency.


