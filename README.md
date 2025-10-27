# Population Dynamic Analysis of Income Mobility Using Lotka–Volterra Model

This repository contains the source code and documentation for the **Bachelor's Project** on analyzing **income mobility** through the lens of **population dynamics**, modeled using the **Lotka–Volterra equations**.

---

## 📘 Project Overview

The project explores **income mobility** — how individuals or groups move between different income classes — using techniques from **complex systems** and **ecological modeling**.

By adapting the **Lotka–Volterra model**, traditionally used in population dynamics (e.g., predator-prey systems), the project aims to model interactions between income groups (e.g., low, middle, and high income) and study the equilibrium and stability of the economic ecosystem.

---

## 📂 Repository Structure

```
Bsc-project/
├── Bs.c project.r
└── README.md
```

### Files

- **`Bs.c project.r`** — main R script implementing the Lotka–Volterra model for income mobility analysis  
- **`README.md`** — documentation for the project  

---

## ⚙️ Requirements

This project is written in **R**. To run it, you need:

- R (≥ 4.0)
- Recommended R packages:
  - `ggplot2` — for visualization  
  - `deSolve` — for solving differential equations  
  - `tidyverse` — for data manipulation and plotting  

You can install dependencies by running:

```r
install.packages(c("ggplot2", "deSolve", "tidyverse"))
```

---

## 🚀 Running the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/yas-karen/Bsc-project.git
   cd Bsc-project
   ```

2. Open `Bs.c project.r` in RStudio or your preferred R environment.

3. Run the script to:
   - Define Lotka–Volterra parameters for income groups  
   - Simulate population (income group) interactions over time  
   - Visualize stability, oscillations, and equilibrium behavior  

4. Adjust model parameters (growth rates, interaction coefficients) to explore different economic dynamics.

---

## 📊 Expected Outputs

- Time-series plots showing income group dynamics  
- Phase-space plots visualizing equilibrium behavior  
- Stability analysis of steady states under parameter variation  

---

## 🧠 Theoretical Background

The **Lotka–Volterra model** is represented as:

\[
\frac{dX_i}{dt} = X_i (a_i + \sum_j b_{ij} X_j)
\]

where:
- \( X_i \) is the population (or wealth share) of group *i*  
- \( a_i \) is the intrinsic growth rate  
- \( b_{ij} \) represents the interaction coefficient between groups *i* and *j*  

This formulation can describe competitive, cooperative, or predatory relationships between income classes, depending on the sign of \( b_{ij} \).

---

## 📄 License

You may include an open-source license (e.g. MIT, GPL-3.0) if you wish to make the code publicly reusable.  

---

## 🧾 Author

**Karen Yas**  
Bachelor’s Project in Complex Systems / Computational Economics  

---

## 📚 References

- Lotka, A. J. (1925). *Elements of Physical Biology.*  
- Volterra, V. (1926). *Fluctuations in the abundance of a species considered mathematically.*  
- Strogatz, S. H. (2015). *Nonlinear Dynamics and Chaos.*  
- Yakovenko, V. M. & Rosser, J. B. (2009). *Colloquium: Statistical mechanics of money, wealth, and income.* *Rev. Mod. Phys.* 81(4), 1703–1725.

---
