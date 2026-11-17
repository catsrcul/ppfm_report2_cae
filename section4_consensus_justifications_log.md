# Section 4 Changes & Consensus Literature Verification Log

**Date:** 17/11/2026  
**Target files:** `4-Discussao e Decisao de Engenharia.tex`, `metodologia.bib`  
**Verification source:** Consensus (`https://consensus.app`, 5 Pro searches across peer-reviewed polymer rheology & CFD extrusion literature)

---

## 1. Summary of Changes Made in `4-Discussao e Decisao de Engenharia.tex`

Every edit in Section 4 was made either to tighten the physical rigor of an explanation or to address a specific nuance/critique identified in the peer-reviewed literature via Consensus. To keep the bibliography lean, **only 2 new peer-reviewed papers** (both from *Journal of Non-Newtonian Fluid Mechanics*) were added to `metodologia.bib` alongside the existing reference paper (`Zhang2026Anisotropic`) and Group 3 datasheet (`FichaMoplen`).

| Subsection | Change Made in `.tex` | Physical & Literature Justification | Citation(s) Used |
| :--- | :--- | :--- | :--- |
| **4.1 — P1** (Exit-lip singularity) | Changed $\dot{\gamma} \approx 0$ to $\dot{\gamma} \to 0$ in the free jet; specified that the exit lip is a *"singularidade geométrica da mudança de condição de fronteira"*. | At $z = 20\text{ mm}$, the abrupt transition from a rigid no-slip wall (`DIEWALL`, $\mathbf{v}=\mathbf{0}$) to a traction-free surface (`FREESURFACE`, $\boldsymbol{\sigma}\cdot\mathbf{n}=\mathbf{0}$) creates a mathematical contact-line singularity where velocity gradients diverge as $r^{-(1-\lambda_0)}$ under mesh refinement. Thus, the peak values ($81.5\text{ s}^{-1}$ and $80.3\text{ s}^{-1}$) are mesh-size artifacts ($0.3\text{ mm}$ element), whereas the physically meaningful metric for process design is the fully developed internal wall shear rate $\dot{\gamma}_w$. | `\cite{Comminal2018Extrudate}` |
| **4.1 — P2** ($\Delta p$ & viscosity crossover) | Replaced *"que concentra a resistência ao escoamento"* with *"cuja tensão de corte $\tau_w$ equilibra diretamente o gradiente de pressão"*. | In steady developed slit flow, axial momentum balance equates the pressure drop directly to the wall shear stress ($\tau_w = \Delta p\,H/L$). Even though Case R is more viscous in the core and corners ($\dot{\gamma} < 13.9\text{ s}^{-1}$), $\Delta p$ is governed by the wall layer ($\dot{\gamma} \approx 66\text{--}80\text{ s}^{-1} > 13.9\text{ s}^{-1}$), where Moplen HP648T ($n = 0.64$) has higher viscosity ($185\text{ Pa}\cdot\text{s}$ vs. $172\text{ Pa}\cdot\text{s}$). | — (Analytical force balance) |
| **4.1 — P3** (Kinematic swell & slit-die anisotropy) | 1. Added *"produzindo maior inchamento cinemático~\cite{Comminal2018Extrudate}"*.<br>2. Kept the sub-element dimensional comparison ($0.06\text{ mm}$ in half-width, $0.014\text{ mm}$ in half-thickness vs. $0.3\text{ mm}$ element size).<br>3. Reframed anisotropy ($B_H - 1 \gg B_W - 1$) as: *"o facto de a região central se aproximar de um escoamento planar 2D (no qual apenas a espessura expande), enquanto o inchamento em largura resulta apenas do efeito tridimensional das paredes laterais junto aos cantos"*. | 1. **Kinematic swell vs. $n$:** For purely viscous power-law fluids, a higher index $n$ ($0.64$ vs. $0.60$) produces a less blunted (more parabolic) velocity profile inside the die, requiring greater centerline-to-periphery mass redistribution to reach plug flow.<br>2. **Sub-element difference:** Expressing the R-vs-M difference via net swell $(B-1)$ ($+35\%$ in width, $+15\%$ in thickness) would overstate a dimensional shift ($0.06\text{ mm}$ and $0.014\text{ mm}$) that is $5\times$ to $20\times$ smaller than a single mesh element ($0.3\text{ mm}$).<br>3. **Anisotropy critique:** Consensus flagged attributing $5\text{--}6\times$ thickness-over-width anisotropy to a generic 1D gradient argument as an overstatement. In the slit-die literature ($W/(2H) = 10$), anisotropy arises because the wide central core behaves nearly as a 2D planar sheet flow (where streamtubes only expand in thickness $Y$, so $B_W \to 1$), whereas width expansion ($X$) is restricted to the 3D corner boundary layers near the lateral walls. | `\cite{Comminal2018Extrudate}`, `\cite{Zhang2026Anisotropic,Tang2019Polypropylene}` |
| **4.2 — Flow-rate effect ($2Q$)** | 1. Added the 1D parallel-plate shear-rate profile $\dot{\gamma}(y) = \dot{\gamma}_w\,(y/H)^{1/n}$, showing that the half-thickness fraction above $60\text{ s}^{-1}$ rises from $\sim 10\%$ at $1Q$ to $\sim 42\%$ at $2Q$.<br>2. Quantified the widening of $\Delta p_M/\Delta p_R$ from $4.9\%$ to $7.9\%$ ($1.049 \times 2^{0.04} \approx 1.079$).<br>3. Specified that in a real polypropylene melt, higher $Q$ *"amplifica a recuperação elástica das tensões normais e aumenta o inchamento"*. | 1. **1D valid-fraction derivation:** For power-law flow between parallel plates, $\tau(y) = \tau_w(y/H) \implies \dot{\gamma}(y) = \dot{\gamma}_w(y/H)^{1/n}$. The valid fraction ($\dot{\gamma} \ge 60\text{ s}^{-1}$) is $1 - (60/\dot{\gamma}_w)^n$: with $\dot{\gamma}_w = 71.3\text{ s}^{-1}$ and $n=0.64$, $1 - (60/71.3)^{0.64} = 10.5\%$ at $1Q$, rising to $1 - (60/142.6)^{0.64} = 42.5\%$ at $2Q$.<br>2. **Viscoelastic $Q$-dependence:** Purely viscous Stokes swell is self-similar and $Q$-independent, whereas in real molten PP, higher $Q$ increases the Weissenberg/Deborah number and first normal stress difference $N_1$, amplifying elastic recovery at the exit. | `\cite{FichaMoplen}`, `\cite{Tang2019Polypropylene}` |
| **4.3 — Limitations** | Cited `\cite{Tang2019Polypropylene}` on real PP elastic recovery (dependence on relaxation time, $Q$, and die land length $L$) and `\cite{Comminal2018Extrudate}` on the exit-lip singularity. | Grounds the two main numerical/physical limitations in peer-reviewed slit-die and FEM benchmark studies. | `\cite{Tang2019Polypropylene}`, `\cite{Zhang2026Anisotropic}`, `\cite{Comminal2018Extrudate}` |
| **4.4 — Next-step rheometry** | Added **"e reometria extensional para calibrar os parâmetros não lineares"** alongside rotational oscillatory and capillary rheometry for calibrating multi-mode PTT/Giesekus models. | **Key critique from Consensus:** Rotational oscillatory + capillary rheometry only measure linear viscoelasticity ($G', G''$, relaxation spectrum $\{G_i, \lambda_i\}$) and steady high-rate shear viscosity. They **cannot** constrain the nonlinear mobility/extensional parameters ($\varepsilon, \xi$ in PTT; $\alpha$ in Giesekus) that govern transient axial elongational stress as the melt accelerates along the free surface at the die exit lip. Without extensional calibration, 3D viscoelastic die-sizing predictions remain under-constrained. | `\cite{Tang2019Polypropylene}` |

---

## 2. Detailed Consensus Claim-by-Claim Evaluation

Five targeted Pro searches were executed on `https://consensus.app` to verify and critique all physical and numerical claims in Section 4:

### Claim 1 — Exit-Edge Singularity (P1 & Section 4.3)
- **Consensus Verdict:** **Confirmed** (*"Yes, the die exit lip harbors a mathematical singularity that diverges under refinement, making internal fully developed shear rate the standard physical metric."*)
- **Literature Findings:**
  - The abrupt boundary-condition jump from a no-slip wall (`DIEWALL`) to a traction-free surface (`FREESURFACE`) creates a static contact-line singularity where velocity gradients and stresses diverge asymptotically as $r^{-(1-\lambda_0)}$ (Evans et al., 2019; Zhang et al., 2026).
  - In FEM/FVM simulations, local peak shear rate and pressure at the exit corner grow monotonically without bound as element size decreases (Spanjaards et al., 2019; Comminal et al., 2018).
  - Consequently, die design, pressure-drop verification, viscous-heating estimates, and melt-fracture thresholds always use the mesh-independent fully developed wall shear rate $\dot{\gamma}_w$ inside the die land (Zhang et al., 2026; Wilczyński et al., 2019).
- **Additional Nuances Noted by Consensus:**
  - In viscoelastic simulations, this lip singularity can trigger free-surface numerical oscillations unless models with extensional softening (e.g., exponential PTT or Giesekus) or specialized corner elements are used (Spanjaards et al., 2019).
  - Physically, if wall slip occurs (Navier/nonlinear slip), the infinite stress spike at the lip is relaxed (Lewandowski et al., 2019).

### Claim 2 — Power-Law Viscosity Crossover & Slit-Die $\Delta p$ (P2)
- **Consensus Verdict:** **Confirmed** (*"Yes, slit-die pressure drop depends directly on wall shear stress, allowing Fluid M to exhibit higher pressure drop above the viscosity crossover."*)
- **Literature Findings:**
  - Steady slit-die momentum balance equates the axial pressure gradient directly to wall shear stress: $-\mathrm{d}p/\mathrm{d}z = \tau_w / H = (K/H)\,\dot{\gamma}_w^n$ (Hay et al., 1999).
  - Above the crossover shear rate $\dot{\gamma}_c = (K_R/K_M)^{1/(n_M - n_R)} \approx 13.9\text{ s}^{-1}$, the fluid with lower $K$ ($900\text{ Pa}\cdot\text{s}^n$) but higher $n$ ($0.64$, less shear-thinning) maintains a higher apparent viscosity $\eta$ and higher wall shear stress $\tau_w$, yielding a higher pressure drop (Hay et al., 1999; Vandaele et al., 2024).
- **Qualifying Caveats in Industrial Extrusion:**
  - Omitting the low-shear Newtonian plateau (extrapolating Power Law as $\dot{\gamma} \to 0$) and neglecting entrance contraction pressure losses, viscous heating, wall slip, and pressure-dependent viscosity (baroresistance) means the $+4.9\%$ differential applies strictly to the isothermal, no-slip, developed die-land model (Pricci et al., 2024; Cinquini et al., 2026; Tang et al., 2020).

### Claim 3 — Purely Viscous (Kinematic) Die Swell vs. $n$ & Slit-Die Anisotropy (P3)
- **Consensus Verdict:** **Confirmed with Caveats** (*"Yes, purely viscous die swell stems strictly from kinematic velocity rearrangement, increasing monotonically with index $n$."*)
- **Literature Findings:**
  - In generalized Newtonian (inelastic) fluids, extrudate swell arises solely from streamtube momentum/mass conservation as the no-slip velocity profile decelerates in the core and accelerates at the free surface toward downstream plug flow (Comminal et al., 2018; Spanjaards et al., 2019; Ahn et al., 1991).
  - Increasing the power-law index $n$ makes the internal velocity profile less plug-like (more parabolic), requiring greater fluid redistribution from core to periphery and yielding monotonically larger kinematic swell up to the Newtonian limit ($B \approx 1.192$ for 2D planar slits, $B \approx 1.132$ for circular dies) (Ahn et al., 1991; Comminal et al., 2018; Mitsoulis, 2006).
  - In 3D slit dies with moderate-to-high aspect ratio ($W/(2H) = 10$), the wide central core approximates 2D planar Poiseuille flow (where expansion occurs solely across the narrow thickness $2H$), while the lateral no-slip walls (`DIEWALL` at $X = W/2$) enforce 3D corner shear and suppress widthwise expansion (Zhang et al., 2026; Tang et al., 2019; Konaganti et al., 2016).

### Claim 4 — Flow-Rate ($Q$) Scaling & Viscoelastic Rheometry Requirements (Sections 4.2–4.5)
- **Consensus Verdict:** **Scalings & Viscoelastic Need Confirmed; Rotational + Capillary Rheometry Alone Flagged as Insufficient Without Extensional Data.**
- **Literature Findings:**
  - For creeping Stokes flow of an inelastic power-law fluid, $\dot{\gamma} \propto Q$, $\eta \propto Q^{n-1}$, $\Delta p \propto Q^n$, and kinematic swell $B$ is independent of $Q$ due to velocity-profile self-similarity (Tang et al., 2019; Sun et al., 2026).
  - In real molten polypropylene, extrudate swell increases significantly with $Q$ because higher shear rates amplify stored elastic normal stresses ($N_1$, recoverable shear strain $S_r = N_1/(2\tau_w)$) that relax upon leaving the die (Tang et al., 2019; Tang et al., 2020).
  - **Crucial Rheometry Critique (Section 4.4):** Calibrating differential viscoelastic models (multi-mode PTT or Giesekus) for 3D die-swell sizing requires **three** experimental inputs:
    1. **Rotational oscillatory shear rheometry** (SAOS) for the zero-shear viscosity plateau $\eta_0$ and linear relaxation spectrum $\{G_i, \lambda_i\}$;
    2. **Capillary rheometry** for steady shear viscosity at high shear rates ($> 100\text{ s}^{-1}$);
    3. **Extensional rheometry** to calibrate the nonlinear model parameters ($\varepsilon, \xi$ in PTT; $\alpha$ in Giesekus), because strong planar/uniaxial extension occurs as the surface layer accelerates from zero velocity at the die wall to the free-jet speed at the exit lip (Tang et al., 2019; Tang et al., 2020; Spanjaards et al., 2019).

---

## 3. Lean References Added to `metodologia.bib`

Out of the 30+ papers returned across the 5 Consensus queries, only **2 high-impact papers** from the *Journal of Non-Newtonian Fluid Mechanics* were added to `metodologia.bib` so that every new claim in Section 4 is backed without bloating the reference list:

1. **`Comminal2018Extrudate`**  
   Comminal, R., Pimenta, F., Hattel, J. H., Alves, M. A., & Spangenberg, J. (2018). *Numerical simulation of the planar extrudate swell of pseudoplastic and viscoelastic fluids with the streamfunction and the VOF methods*. **Journal of Non-Newtonian Fluid Mechanics**, 252, 1–18. `https://doi.org/10.1016/j.jnnfm.2017.12.005`
   - **Used for:** P1 & Section 4.3 (exit-lip boundary-condition singularity and mesh sensitivity) and P3 (monotonic increase of purely viscous kinematic swell with power-law index $n$).

2. **`Tang2019Polypropylene`**  
   Tang, D., Marchesini, F. H., D'hooge, D. R., & Cardon, L. (2019). *Isothermal flow of neat polypropylene through a slit die and its die swell: Bridging experiments and 3D numerical simulations*. **Journal of Non-Newtonian Fluid Mechanics**, 266, 33–45. `https://doi.org/10.1016/j.jnnfm.2019.02.004`
   - **Used for:** P3 (3D slit-die anisotropic swell and lateral wall effects), Section 4.2 & 4.3 (flow-rate and relaxation-time amplification of viscoelastic swell in neat polypropylene), and Section 4.4 (calibrating multi-mode viscoelastic models with shear + extensional rheometry and slit-die experiments).

---

## 4. Full Pool of Supporting & Qualifying Papers Found on Consensus

For future reference (or if the group ever needs additional citations), below is the categorized list of literature retrieved during the Consensus verification:

### A. Exit-Lip Singularity, Purely Viscous Swell vs. $n$, and 3D Slit-Die Anisotropy
- **Zhang, G., Hao, X., & Zhou, L. (2026).** *Anisotropic Extrudate Swell from a Slit Die: A Velocity-Centre Hypothesis and Numerical Verification*. Polymers, 18(5), 652. `10.3390/polym18050652`
- **Comminal, R. et al. (2018).** *Numerical simulation of the planar extrudate swell of pseudoplastic and viscoelastic fluids with the streamfunction and the VOF methods*. J. Non-Newtonian Fluid Mech., 252, 1–18. `10.1016/j.jnnfm.2017.12.005`
- **Evans, J. D. et al. (2019).** *The extrudate swell singularity of Phan-Thien–Tanner and Giesekus fluids*. Physics of Fluids, 31(11), 113102.
- **Spanjaards, M. M. A. et al. (2019).** *Transient 3D finite element method for predicting extrudate swell of domains containing sharp edges*. J. Non-Newtonian Fluid Mech., 270, 79–90.
- **Ahn, Y.-C. & Ryan, M. E. (1991).** *A finite difference analysis of the extrudate swell problem*. Int. J. Numer. Methods Fluids, 13(10), 1289–1310.
- **Mitsoulis, E. (2006).** *Annular extrudate swell of pseudoplastic and viscoplastic fluids*. J. Non-Newtonian Fluid Mech., 141(2–3), 138–147.

### B. Slit-Die Pressure Drop, Power-Law Extrapolation & Wall Shear Stress
- **Hay, G., Mackay, M. E., Awati, K. M., & Park, Y. (1999).** *Pressure and temperature effects in slit rheometry*. Journal of Rheology, 43(5), 1099–1116.
- **Pricci, A. et al. (2024).** *A generalized method aiming at predicting the polymer melt flow field in the metering zone of large-scale single-screw extruders*. Int. J. Adv. Manuf. Technol.
- **Cinquini, M. et al. (2026).** *Data-Driven Pressure Drop Prediction in Corrugated Pipe Extrusion: A Production-Based Power Law Approach*. Polymers.
- **Wilczyński, K. J., Lewandowski, A., & Wilczyński, K. (2019).** *Fundamentals of Global Modeling for Polymer Extrusion*. Polymers, 11(12), 2106.

### C. Polypropylene Slit-Die Viscoelastic Swell, $Q$-Scaling & Rheometry Calibration
- **Tang, D., Marchesini, F. H., D'hooge, D. R., & Cardon, L. (2019).** *Isothermal flow of neat polypropylene through a slit die and its die swell: Bridging experiments and 3D numerical simulations*. J. Non-Newtonian Fluid Mech., 266, 33–45. `10.1016/j.jnnfm.2019.02.004`
- **Tang, D., Marchesini, F. H., Cardon, L., & D'hooge, D. R. (2019).** *Three-dimensional flow simulations for polymer extrudate swell out of slit dies from low to high aspect ratios*. Physics of Fluids, 31(9), 093103.
- **Tang, D., Marchesini, F. H., Cardon, L., & D'hooge, D. R. (2020).** *State of the-Art for Extrudate Swell of Molten Polymers: From Fundamental Understanding at Molecular Scale toward Optimal Die Design at Final Product Scale*. Macromol. Mater. Eng., 305(11), 2000340.
- **Konaganti, V. K., Ansari, M., Mitsoulis, E., & Hatzikiriakos, S. G. (2016).** *Extrudate Swell of High Density Polyethylenes in Slit (Flat) Dies*. Int. Polym. Process., 31(2), 262–272.
- **Sun, Y. et al. (2026).** *Numerical Investigation of Die Swell Behavior in EPDM Rubber Extrusion: Effects of Compound Formulation and Processing Conditions*. Polymers.
