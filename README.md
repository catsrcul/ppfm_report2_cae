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

> [!IMPORTANT]
> **Commit and sync as soon as a change is done.** Edits that stay only on your computer are invisible to the rest of the group, and the longer they wait, the more likely they clash with someone else's.
>
> **If you use an AI assistant (Claude, Gemini, ChatGPT, …) to edit the report:** after it makes a change and you reply that it's good, it must remind you to commit and sync, with a one-line commit message describing the change. It should not commit for you unless you ask. These rules are in `AGENTS.md`, which Claude Code, Gemini CLI and Codex read automatically (`CLAUDE.md` and `GEMINI.md` just point to it).

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

---

## 4. Status Against the Brief (checked 15/11/2026)

Checked against `PPFM_Portfolio_CAE_Extrusao_Polyflow_2026-2027_REV2.pdf` (sections 4–9). Rating: **great** = fully done and strong, **good** = done, **ok** = done with small issues, **bad** = missing or needs work, **to check** = can't be judged from the report itself.

### Overall

| Item | Brief asks | Status | Notes / what's missing |
| :--- | :--- | :---: | :--- |
| Length | ~5–7 pages of main body (cover, references and annexes excluded) | **bad** | Body runs from p. 4 to p. 12, about **8.5 pages**. Needs ~1.5–2 pages cut (see "Where to cut" below). |
| Workbench project | PDF **and** a Workbench/Polyflow project where Cases R and M can be reopened | **to check** | Workbench stores absolute file paths, so a project copied between computers can lose its mesh. Before submitting, open it on a different computer from the one it was built on, and submit it with **File → Archive (.wbpz)**, which packs every referenced file. |
| Cover | Course, group, students, material/grade, software version, date | **great** | All present. |
| AI declaration | Tools, purpose, contribution, how it was verified | **good** | Complete. Keep the tools list in line with what the group actually used. |
| References | Cited sources, good quality | **ok** | Only 2 references (Zhang 2026, the datasheet). The brief also lists **Tang et al. (2020)**, a review on extrudate swell, which would support the elastic-swell limitation in 4.3. |

### Section 1: Paper and predictions

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Q1: Problem studied and main simplifications | **good** | Incompressible, fully developed laminar, isothermal, infinite width. |
| Q2: Role of die land vs. free-surface region | **good** | |
| Q3: Why not a physical validation, and where across the width validity is lost | **great** | Power law has no elasticity; edges of the width, errors > 30 %, cited. |
| P1, P2, P3: Predictions with justification | **good** | All three present and kept as written before the simulation, which is correct. |

### Section 2: Numerical model

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Regime: 3D, steady, isothermal | **great** | Plus a Reynolds-number check ($Re \approx 3\times10^{-4}$). |
| Rheology R and M, datasheet validity range | **great** | Table 1 with sources, control values checked, note that Case R uses n = 0.6 instead of the paper's 0.5. |
| Inlet: fully developed, $Q = 2\times10^{-7}$ m³/s | **good** | |
| Boundary conditions on all Named Selections | **good** | OUTLET confirmed as Outflow ($f_n = f_s = 0$) in `polyflow.dat`. |
| Numerical setup: justify only changes | **good** | Evolution on moving boundaries, Picard not needed, mesh unchanged and stated. |
| Case M copied from R, only fac/expo changed | **good** | Stated in 2.3. |

### Section 3: Cases R and M

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Convergence | **good** | S = 1 in 10 steps, none failed, criterion $10^{-3}$. |
| Flow conservation $Q_{in}$, $Q_{out}$, $\varepsilon_Q$ | **good** | Table 2, $\varepsilon_Q$ = 0.009 %. |
| $\Delta p$ from area averages | **great** | Plus a 1D analytical check (~9 % gap explained, R/M ratio matches). |
| Velocity map with scale and units, same in R and M | **good** | Common scale 0–0.035 m/s. |
| Shear-rate field, critical region and range, same scale | **great** | Exit-edge singularity correctly flagged as mesh-dependent. |
| $B_W$, $B_H$ at 40 mm after the die exit | **ok** | Values correct at z = 60 mm. In Figure 3 the reader can't tell which outline is the die and which is the extrudate (green fill vs black line): say it in the caption. |
| Case M shear rates vs datasheet range | **great** | Figure 4 plus the explanation of why $\Delta p$ is reliable and $B$ is not. Small fix: the figure legend shows the ranges (60–500, 5.7–80.3) and $K$ without units. |

### Section 4: Discussion and decision

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Q1: Which predictions were confirmed, and why | **great** | P1 confirmed with a caveat, P2 with the 13.9 s⁻¹ crossover, P3 small and below mesh resolution. |
| Q2: Main R vs M difference and the property behind it | **good** | $\Delta p$ +4.9 %, explained by n. |
| Q3: Effect of higher flow rate on $\Delta p$, $\dot\gamma$, $\eta$ | **great** | Scalings $Q$, $Q^{n-1}$, $Q^n$, plus the 4.9 % → 7.9 % gap and validity coverage. |
| Q4: Main limitation and next step | **good** | No elasticity; rheometry, mesh study, experiment. |
| Scientific limit: viscous swell is not a quantitative prediction | **great** | Stated in 4.3 and used in the decision. |
| Engineering decision | **good** | Pressure is OK for the material change; don't size the die for swell yet. |

### Where to cut (to reach ~7 pages)

1. **Section 1.1** (~0.3 p): Q1 and Q2 can be one paragraph each, half the current length.
2. **Section 3.3** (~0.3 p): the first paragraph repeats the wall shear-rate numbers from 3.2 and Table 4. Keep only the reliability argument (second paragraph).
3. **Table 4** (~0.2 p): drop the rows for $\bar p_{\text{saída}}$, $\dot\gamma_{\min}$ and $v_{\max}$; they're in the text or not needed.
4. **Section 4.1** (~0.4 p): P1 and P3 repeat numbers already in Section 3. Refer to the table instead.
5. **Figures** (~0.5 p): page 8 is almost only Figure 1 with white space around it. Placing Figures 1–3 with `[t]` instead of `[htbp]`, so text flows under them, recovers most of that page.
