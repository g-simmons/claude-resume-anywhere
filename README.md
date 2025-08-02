# claude-resume-anywhere

Resume Claude sessions from anywhere using fzf.

## What it does

Reads Claude project files from `~/.claude/projects/`, extracts working directories and displays them in an interactive fzf menu. When you select a directory, it resumes the Claude session in that location.

## Dependencies

- `jq` - JSON processor
- `fzf` - Fuzzy finder
- `claude` CLI

## Usage

```bash
claude-resume-anywhere [-s sort_field]
```

Options:
- `-s sort_field`: Field to sort projects by (default: timestamp)

## Note

This tool is for personal use and not officially supported.