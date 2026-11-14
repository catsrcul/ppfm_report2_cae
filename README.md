# PPFM — Report 2 (CAE / Polyflow)

LaTeX project for **Processamento de Polímeros e Ferramentas Moldantes — Relatório 2 (CAE)**.

---

## 1. First-Time Setup (Do Once)

1. **Install a LaTeX distribution** (provides `pdflatex` and `latexmk`):
   - **Windows:** [MiKTeX](https://miktex.org/download) (or [TeX Live](https://tug.org/texlive/)) — *on Windows, you also need [Strawberry Perl](https://strawberryperl.com/) for `latexmk`*.
   - **macOS:** [MacTeX](https://tug.org/mactex/) (or `brew install --cask mactex`).
   - **Linux:** `sudo apt install texlive-full latexmk` (Ubuntu/Debian).
2. **Install [VS Code](https://code.visualstudio.com/)** and [Git](https://git-scm.com/downloads).
3. **Clone this repository** in VS Code:
   - Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux) → type `Git: Clone` → paste the GitHub repository URL → choose a folder → click **Open**.
4. **Install the recommended extension:**
   - When VS Code asks *"Do you want to install the recommended extensions for this repository?"*, click **Install** (this installs **LaTeX Workshop**).

---

## 2. Daily Workflow in VS Code (3 Clicks, No Terminal Needed)

1. **Before you start editing:**
   - Open the **Source Control** tab on the left sidebar (branch icon) and click **Sync Changes** (or `...` → **Pull**) to download everyone else's latest edits.
2. **While writing:**
   - Edit your assigned `.tex` section file and save (`Cmd+S` / `Ctrl+S`).
   - **LaTeX Workshop** automatically compiles `main.pdf` on save. Click the **View LaTeX PDF** icon (top right of the editor) to preview it in a tab.
3. **When you finish a work session:**
   - In the **Source Control** tab, write a short message describing what you changed (e.g., `Update Caso M discussion`).
   - Click **Commit** (click *Yes* if it asks to stage all changes), then click **Sync Changes** to push to GitHub.

---

## 3. Project Structure & Avoiding Merge Conflicts

To avoid merge conflicts, **each person should only edit their assigned section file**:

| File | Purpose |
| :--- | :--- |
| `main.tex` | Document preamble, cover page, and `\input{...}` structure |
| `1-Artigo e Previsoes.tex` | Section 1 — Critical reading & predictions |
| `2-Modelo Numerico.tex` | Section 2 — Numerical model & setup |
| `3-Caso R e Caso M.tex` | Section 3 — Case R & Case M results |
| `4-Discussao e Decisao de Engenharia.tex` | Section 4 — Discussion & engineering decision |
| `metodologia.bib` | BibTeX references |
| `Imagens/` | Figures and cover images |

> **Note:** `main.pdf` and temporary build files (`.aux`, `.log`, etc.) are intentionally ignored by `.gitignore` so teammates never hit binary PDF merge conflicts. Each member compiles `main.pdf` locally in VS Code.
