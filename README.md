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
| `section4_consensus_justifications_log.md` | Literature verification & justifications for Section 4 edits (Consensus) |
| `Imagens/` | Figures and cover images |

> **Note:** `main.pdf` and temporary build files (`.aux`, `.log`, etc.) are intentionally ignored by `.gitignore` so teammates never hit binary PDF merge conflicts. Each member compiles `main.pdf` locally in VS Code.

---

## 4. Status Against the Brief (checked 17/11/2026)

Checked against `PPFM_Portfolio_CAE_Extrusao_Polyflow_2026-2027_REV2.pdf` (sections 4–10) and `PPFM_Ficha_Reologica_Grupo_3_Moplen.pdf`. Rating: **great** = fully done and strong, **good** = done, **ok** = done with small issues, **bad** = missing or needs work, **to check** = can't be judged from the report itself.

### Overall

| Item | Brief asks | Status | Notes / what's missing |
| :--- | :--- | :---: | :--- |
| Length | ~5–7 pages of main body (cover, references and annexes excluded) | **bad** | Main body runs from `Página 1` to `Página 9` (PDF pp. 4–12, **~8.7 pages**). Needs ~1.7–2 pages cut (see "Where to cut" below). |
| Workbench project | PDF **and** a Workbench/Polyflow project where Cases R and M can be reopened | **to check** | Both Case R (`PFL`) and Case M (`PFL-1`) are in `ppfm_r2_ansys/P2/`, **but `P2.wbpj` has a hardcoded absolute path** (`C:\Users\leona\OneDrive\...\meshzhang.poly`) for `Imported Mesh`. Before submitting, open on another PC or export via **File → Archive (`.wbpz`)** with external files included. |
| Cover | Course, group, students, material/grade, software version, date | **great** | All present (`Moplen HP648T`, `220 °C`, `Ansys Polyflow 2026 R1 (Student)`, `19/11/2026`). |
| Frontmatter & structure | Single concise document (cover, Sections 1–4, AI declaration, references) | **ok** | `main.tex` includes 2 extra Roman pages (`Página I–II`) for TOC/LOF/LOT, a stray `\addcontentsline{toc}{part}{Elementos finais}`, and an empty `\appendix` at the end. Not required for a 5–7 page portfolio. |
| AI declaration | Tools, purpose, contribution, how it was verified | **ok** | Complete and well verified, but `main.tex` has two small typos: a trailing semicolon in `Ferramenta(s): Claude; Gemini;` (add `Consensus` if kept, or remove `;`) and `Auxilío` → `Auxílio` (line 224). |
| References | Cited sources, good quality | **great** | Now has 4 lean, verified sources with DOIs: Zhang et al. (2026), Group 3 Rheological Sheet, Comminal et al. (2018) (exit singularity & kinematic swell), and Tang et al. (2019) (3D PP slit-die swell & viscoelasticity). Small fix in `metodologia.bib`: wrap `{Grupo 3: Moplen HP648T}` and `{220~°C}` in braces in `FichaMoplen` so BibTeX doesn't lowercase `hp648t` and `°c`. |
| Language & formatting (PT-PT / `siunitx`) | Clear PT-PT prose, SI units, `\autoref` cross-references | **great** | Zero PT-BR terms across all 5 `.tex` files; all numbers and units formatted with `siunitx` and comma decimal markers. |

### Section 1: Paper and predictions (`1-Artigo e Previsoes.tex`)

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Q1: Problem studied and main simplifications | **good** | Incompressible, fully developed laminar, isothermal, power-law, infinite width. |
| Q2: Role of die land vs. free-surface region | **good** | Wall confinement and velocity profile development vs. stress-free velocity relaxation and swell. |
| Q3: Why not a physical validation, and where across the width validity is lost | **great** | Power law has no elasticity; lateral walls ignored by infinite-width assumption, errors > 30 % at the width edges cited. |
| P1, P2, P3: Predictions with justification | **good** | All three present and kept as written before the simulation. Minor polish: remove trailing `\\` at the end of P1 (line 15) and P2 (line 19) (causes `Underfull \hbox`), and avoid repeating `Mantendo ... manter` in P2 (line 19). |

### Section 2: Numerical model (`2-Modelo Numerico.tex`)

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Domain, geometry & mesh | **great** | 1/4 domain ($10 \times 1 \times 60\text{ mm}$), supplied uniform hex mesh ($27\,336$ elements, $35\,350$ nodes, $0.3\text{ mm}$), unchanged in R and M, and contrasted with the paper's graded mesh near the exit lip. |
| Regime: 3D, steady, isothermal | **great** | Plus a Reynolds-number check ($Re \approx 3\times10^{-4}$) justifying Stokes flow, and explicit statement of purely viscous assumption. |
| Rheology R and M, datasheet validity range | **great** | Table 1 with sources, control values checked ($\eta(60)=206\text{ Pa}\cdot\text{s}$, $\eta(500)=96\text{ Pa}\cdot\text{s}$), and note that Case R uses $n = 0.60$ from the brief instead of the paper's $0.50$. |
| Inlet: fully developed, $Q = 2\times10^{-7}\text{ m}^3/\text{s}$ | **good** | Equivalent to $200\text{ mm}^3/\text{s}$ in 1/4 of the domain. |
| Boundary conditions on all Named Selections | **good** | Table 2 covers `INLET`, `DIEWALL`, `FREESURFACE` (fixed at `DIEWALL` edge), `OUTLET` ($\boldsymbol{\sigma}\cdot\mathbf{n}=\mathbf{0}$), `SYMETRYX`, `SYMETRYY`. |
| Numerical setup: justify only changes & distinguish from physics | **great** | Evolution on moving boundaries ($S: 0 \to 1$ since $n < 0.75$), Newton + Optimesh 3D, criterion $10^{-3}$, Picard not needed, and explicitly separated from physical/rheological choices. |
| Case M copied from R, only `fac`/`expo` changed | **good** | Stated in 2.3. |

### Section 3: Cases R and M (`3-Caso R e Caso M.tex`)

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Convergence | **good** | $S = 1$ in 10 steps, 0 failed steps, criterion $10^{-3}$, CPU times reported ($409\text{ s}$ and $336\text{ s}$). |
| Flow conservation $Q_{\mathrm{in}}$, $Q_{\mathrm{out}}$, $\varepsilon_Q$ | **good** | Table 3, $\varepsilon_Q = 0.009\text{ \%}$ (residual free-surface flux $1.8\times10^{-11}\text{ m}^3/\text{s}$). |
| $\Delta p$ from area averages & physical coherence | **great** | Area averages at $z=0$ and $z=20\text{ mm}$ plus 1D parallel-plate analytical check (~9 % 3D wall/exit gap explained, $\Delta p_M/\Delta p_R = 1.049$ vs. $1.050$). |
| Velocity map with scale and units, same in R and M | **good** | Figure 1: common scale $0\text{--}0.035\text{ m/s}$ on $Y=0$. Optional clarity note: $+Z$ points right-to-left in the screenshots (die land on the right, free jet on the left). |
| Shear-rate field, critical region and range, same scale | **great** | Figure 2: common scale $0\text{--}90\text{ s}^{-1}$, exit-lip singularity ($z=20\text{ mm}$) flagged as mesh-dependent ($81.5$ / $80.3\text{ s}^{-1}$). |
| $B_W$, $B_H$ at $40\text{ mm}$ after the die exit | **ok** | Values correct at $z = 60\text{ mm}$. **Still needed in Figure 3 caption:** state which outline is the nominal die (green filled rectangle) and which is the extrudate at $z=60\text{ mm}$ (black contour line). |
| Case M shear rates vs. datasheet range | **great** | Figure 4 plus physical explanation of why $\Delta p$ is reliable (governed by $\tau_w = \Delta p\,H/L$ at $66\text{--}80\text{ s}^{-1}$) and why $B_W, B_H$ are affected by low-$\dot{\gamma}$ extrapolation ($< 60\text{ s}^{-1}$). Small fix in `viscosidade_validade.png`: the plot legend omits units on $K$ ($\text{Pa}\cdot\text{s}^n$) and on the shear-rate ranges ($60\text{--}500\text{ s}^{-1}$, $5.7\text{--}80.3\text{ s}^{-1}$). |
| Summary comparison table (R vs. M) | **great** | Table 4 compiles all metrics and relative variations $(M-R)/R$. |

### Section 4: Discussion and decision (`4-Discussao e Decisao de Engenharia.tex`)

| Brief asks | Status | Notes / what's missing |
| :--- | :---: | :--- |
| Q1: Which predictions were confirmed, and why | **great** | P1 confirmed with exit-singularity caveat (`Comminal2018Extrudate`), P2 confirmed with the $13.9\text{ s}^{-1}$ viscosity crossover and wall shear stress equilibrium, P3 confirmed in direction with sub-element scale caveat ($0.06\text{ mm}$ / $0.014\text{ mm} \ll 0.3\text{ mm}$) and 2D core vs. 3D edge anisotropy (`Zhang2026Anisotropic`, `Tang2019Polypropylene`). |
| Q2: Main R vs M difference and the property behind it | **great** | $\Delta p$ $+4.9\text{ }\%$, explained by higher $n = 0.64$ (less shear-thinning above $13.9\text{ s}^{-1}$), while kinematics remain geometry/flow-rate controlled ($< 3\text{ }\%$ change). |
| Q3: Effect of higher flow rate on $\Delta p$, $\dot\gamma$, $\eta$ | **great** | Exact power-law scalings ($\dot{\gamma}\propto Q$, $\eta\propto Q^{n-1}$, $\Delta p\propto Q^n$) evaluated at $2Q$: $\dot{\gamma}_w \to 143\text{ s}^{-1}$, valid half-thickness fraction rises from $10\text{ }\%$ to $42\text{ }\%$, $\eta$ drops to $78\text{ }\%$, $\Delta p_M/\Delta p_R$ gap widens from $4.9\text{ }\%$ to $7.9\text{ }\%$, plus contrast with real PP elastic swell (`Tang2019Polypropylene`). |
| Q4: Main limitation and next step | **great** | Absence of viscoelasticity (`Tang2019Polypropylene`), low-$\dot{\gamma}$ extrapolation, isothermal assumption, and uniform mesh (`Comminal2018Extrudate`); next step specifies rotational oscillatory + capillary + extensional rheometry to fit Cross/Carreau-Yasuda and multi-mode PTT/Giesekus models, mesh refinement, and slit-die trials. |
| Scientific limit: viscous swell is not a quantitative prediction | **great** | Explicitly stated in 4.3 and 4.5 (`Zhang2026Anisotropic`, `Tang2019Polypropylene`). |
| Engineering decision | **great** | Clear two-part decision: approve material substitution regarding die pressure ($\approx 300\text{ kPa}$, $+5\text{ }\%$, inside valid datasheet range); do not resize the die aperture for swell until viscoelastic simulation and experimental validation are completed. |

### Where to cut (to bring the 8.7-page body down to ~7 pages)

1. **Line spacing & figure sizing in `main.tex` / Section 3** (~1.0 p without losing content):
   - `Página 5` (PDF p. 8) contains only Figures 1 and 2 with whitespace; placing Figures 1–4 with `[t]` instead of `[htbp]` and shrinking Figure 4 (`viscosidade_validade.png`) from `0.72\textwidth` to `0.58\textwidth` lets text flow cleanly around the floats.
   - If allowed by group formatting, changing `\setstretch{1.25}` in `main.tex` to `\setstretch{1.15}` alone reduces the 8.7-page body by ~0.7 pages.
2. **Section 1.1** (~0.25 p): Q1 and Q2 can be tightened into one concise paragraph.
3. **Section 3.3** (~0.25 p): the first paragraph (`Na parede da matriz, a taxa de deformação varia entre 5,7 s⁻¹...`) repeats the wall shear-rate numbers already in 3.2 and Table 4; merge its one new point ($\eta \to \infty$ as $\dot{\gamma} \to 0$) into the reliability paragraph.
4. **Table 4** (~0.15 p): drop the rows for $\bar p_{\text{saída}}$, $\dot\gamma_{\min}$ and $v_{\max}$ (already stated in the text or redundant with $\Delta p$).
5. **Section 4.1** (~0.3 p): P1 and P2 repeat numerical pairs already in Table 1 and Table 4; refer to `\autoref{tab:sintese_RM}` instead of re-listing both cases' numbers.
