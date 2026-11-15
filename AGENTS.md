# Instructions for AI assistants

This repository is a group LaTeX report (PPFM, CAE extrusion portfolio) shared by several students through GitHub. Read `README.md` for the structure and workflow.

## Remind the user to commit

After you change a file and the user confirms the change is good (for example "it's good", "ok", "looks fine"), **remind them to commit and sync**, and suggest a one-line commit message that describes the change. Example:

> Remember to commit and sync so the group sees this. Suggested message: `Section 4: add flow-rate effect on Δp`

Do not commit or push yourself unless the user asks you to. Remind again at the end of the session if changes are still uncommitted.

## Other rules

- Edit only the section file(s) the user is working on (`1-…tex` to `4-…tex`); `main.tex` holds the cover, preamble and AI declaration. This avoids merge conflicts between group members.
- The report is written in **European Portuguese (PT-PT)**. Never use Brazilian Portuguese terms (e.g. *usinagem*, *resfriamento*, *varredura*, *planejamento*).
- Use `siunitx` for numbers and units, and `\autoref{…}` for cross-references.
- Never commit `main.pdf` or LaTeX build files; they are ignored on purpose.
