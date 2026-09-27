# Web Application Penetration Testing Lab (DVWA + OWASP Juice Shop)

A beginner-friendly, isolated practice environment for learning web application security. It uses GitHub Codespaces for the workspace, a Kali Linux container for security tools, and intentionally vulnerable DVWA and OWASP Juice Shop containers.

> **Safety:** These targets are deliberately vulnerable. Use them only in this local lab or another environment where you have explicit written authorization. Do not expose the vulnerable apps publicly or scan systems you do not own/have permission to test.

## Start in GitHub Codespaces

1. Create a new **public or private** GitHub repository and upload this project's files (keep the folder structure).
2. Open the repository on GitHub, choose **Code → Codespaces → Create codespace on main**.
3. Wait for the Codespace to finish creating. The setup runs `docker compose up -d` automatically.
4. In the Codespaces terminal, check services:
   ```bash
   ./scripts/status.sh
   ```
5. Open the forwarded ports from the **Ports** tab:
   - DVWA: port `8080`
   - OWASP Juice Shop: port `3000`

If the apps did not start automatically, run:
```bash
./scripts/start.sh
```

## Kali Linux tools

Open a terminal in the Codespace and enter the Kali container:
```bash
docker compose exec kali bash
```
The container installs Nmap, Gobuster, SQLMap, curl, and git at first startup. Check:
```bash
nmap --version
gobuster version
sqlmap --version
```

The Kali container and vulnerable apps share a private Docker network. From Kali, the practice targets are:
- `http://dvwa/`
- `http://juice-shop:3000/`

Use the app's own documentation and training pages to learn each vulnerability. Start with harmless discovery and keep all testing limited to these targets.

## Stop and reset

```bash
./scripts/stop.sh
```
To start again, use `./scripts/start.sh`. Stopping does not delete the app data volumes. To reset DVWA's database, use DVWA's **Setup / Reset DB** page.

## What's included

- `.devcontainer/devcontainer.json` — Codespaces configuration
- `docker-compose.yml` — isolated Kali, DVWA, and Juice Shop services
- `scripts/` — start, stop, and status helpers
- `docs/report-template.md` — a concise report template for documenting authorized lab findings

## Troubleshooting

- If a port is not visible, open the **Ports** tab and forward `8080` or `3000`.
- If a container is still initializing, wait briefly and run `./scripts/status.sh`.
- Codespaces needs Docker support enabled for the repository. If your organization restricts Docker or Codespaces, run the same Compose stack on a machine with Docker Compose installed.
