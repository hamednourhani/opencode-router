# OpenCode Router Configuration

Backup of my OpenCode agent setup — the router with architect/developer/reviewer loop.

## What's here

- `.config/opencode/` — all OpenCode configuration
  - `AGENTS.md` — router delegation rules + codebase-memory instructions
  - `opencode.json` — models, MCP servers, permissions
  - `agents/` — agent definitions (router, architect, developer, reviewer)
- `.agents/` — installed skills (elasticsearch-onboarding, find-skills)

## Restore

```bash
cd ~/Workspace/router
./setup.sh
```

Or manually:

```bash
# Config
cp -r .config/opencode/* ~/.config/opencode/

# Skills
cp -r .agents/* ~/.agents/
```

## Post-restore

1. Edit `~/.config/opencode/opencode.json` — update any machine-specific paths (e.g. `external_directory` entries, MCP binary paths)
2. Set env vars: `OPENCODE_API_KEY`, `DEEPSEEK_API_KEY`
3. Install MCP dependencies as needed

## Models

| Agent     | Model                 |
|-----------|-----------------------|
| router    | deepseek/deepseek-v4-pro |
| architect | opencode/minimax-m3   |
| developer | deepseek/deepseek-v4-pro |
| reviewer  | opencode/qwen3.6-plus |
