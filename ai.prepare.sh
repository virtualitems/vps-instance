pnpm add -D @fission-ai/openspec@latest

pnpm exec openspec config set delivery skills

pnpm exec openspec init --tools claude,codex,opencode

pnpm dlx skills@latest add vercel-labs/agent-skills --skill '*' --agent codex --agent claude-code --agent opencode --yes

pnpm dlx skills@latest add anthropics/skills --skill '*' --agent codex --agent claude-code --agent opencode --yes

pnpm dlx skills@latest add supabase/agent-skills --skill '*' --agent codex --agent claude-code --agent opencode --yes

pnpm dlx skills@latest add Gentleman-Programming/Gentleman-Skills --skill '*' --agent codex --agent claude-code --agent opencode --yes

pnpm dlx skills@latest add github/awesome-copilot --skill '*' --agent codex --agent claude-code --agent opencode --yes

pnpm dlx skills@latest list --agent codex --agent claude-code --agent opencode
