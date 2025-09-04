Interview crib notes (say it like a boss)

Why Actions? “Native to GitHub—no Jenkins infra. Workflows compile & deploy on push to mytaskapp with path filters so only relevant jobs run.”

Backend deploy safety? “Upload JAR to /tmp, sudo-move into place, restart systemd, then health-check /actuator/health—pipeline fails fast if unhealthy.”

Frontend deploy? “S3 static hosting; pipeline syncs dist/. For prod I’d use CloudFront + OAC and keep S3 private.”

Secrets? “Stored in GitHub Secrets. On AWS side I use least-privilege IAM to restrict S3 access to just the target bucket.”

Small-instance resilience? “Capped JVM heap (-Xmx256m) and split roles (app vs DB). CI runs in Actions to avoid overloading t2.micro.”


“I implemented CI/CD with GitHub Actions. Workflows live in .github/workflows/. I used path filters so only backend/frontend pipelines run depending on the files changed. For backend, I build a Spring Boot JAR and deploy to EC2 over SSH. For frontend, I sync the Angular dist/ folder to S3. Secrets like EC2 key and AWS creds are stored in GitHub Secrets.”