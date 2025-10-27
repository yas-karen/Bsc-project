
# Load libraries
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("reshape2")) install.packages("reshape2")
library(ggplot2)
library(reshape2)

# --- Load 9D dataset ---
X <- as.matrix(read.table(header=FALSE, text="
25.83 18.68 17.68 30.99 48.88 28.41 20.07 05.16 03.38
23.68 18.26 17.66 28.70 49.77 30.70 23.26 05.41 03.21
23.31 17.84 17.84 27.36 47.23 32.43 26.35 06.48 03.85
23.79 18.46 18.46 27.48 47.38 32.40 26.25 06.97 04.10
23.68 19.32 19.73 28.25 46.31 33.02 26.38 07.06 03.94
22.25 20.15 18.86 27.70 44.92 33.16 29.39 08.40 05.25
20.98 20.98 18.65 26.49 44.71 33.48 31.99 08.89 05.27
20.75 21.17 19.89 28.45 45.99 33.37 30.59 08.56 05.13
22.03 22.90 20.74 30.02 44.50 33.70 29.59 07.56 04.75
22.02 22.02 20.71 29.43 44.47 34.44 31.39 08.50 05.23
21.58 22.90 21.14 28.85 44.48 33.91 32.37 09.24 05.73
21.15 22.48 20.48 29.38 43.41 34.73 34.73 09.79 06.68
22.06 21.38 20.48 30.16 43.89 34.89 34.44 10.80 06.98
23.17 22.95 21.58 30.22 44.53 34.31 33.63 10.45 06.13
23.64 23.64 22.49 31.21 44.06 34.65 33.05 10.79 05.97
24.56 23.63 22.70 31.05 46.57 32.67 33.13 10.19 07.18
24.78 23.38 22.91 31.79 45.59 33.20 33.67 11.22 07.48
23.58 23.58 22.40 31.59 45.27 33.01 35.84 12.26 08.49
23.79 23.31 21.89 30.93 45.20 34.26 36.64 12.85 09.04
24.01 21.85 21.37 30.01 43.94 35.29 38.89 13.93 10.80
23.75 22.29 21.32 30.53 43.61 35.13 39.49 15.02 11.39
23.72 22.00 20.78 31.05 44.74 34.72 40.09 15.16 12.23
22.21 22.46 21.72 30.36 44.92 35.05 40.72 16.29 13.33
23.46 22.46 21.76 31.45 46.92 35.19 40.19 15.72 12.73
24.53 23.77 22.51 32.12 46.53 35.41 39.71 15.93 12.39
25.39 25.14 23.34 31.55 46.94 34.88 41.04 15.65 12.57
25.99 25.47 23.13 33.79 46.52 34.30 40.28 16.37 14.03
24.99 26.05 24.21 33.68 46.04 35.26 41.31 16.57 15.26
23.97 25.02 23.97 33.02 48.20 35.95 42.87 17.84 15.45
23.98 25.32 23.98 33.68 46.61 36.10 44.99 18.05 16.97
23.72 24.53 23.44 33.26 47.16 36.80 44.98 19.89 18.81
23.17 23.72 22.34 33.10 47.44 36.96 46.89 21.24 20.69
21.20 23.44 23.99 32.08 47.71 36.27 48.55 22.60 23.16
21.73 23.42 23.14 32.45 48.54 36.97 49.38 22.58 24.27
22.79 24.79 23.36 33.90 47.86 37.61 47.86 23.08 23.93
23.87 25.31 23.29 34.80 47.45 37.10 48.60 23.58 23.30
24.37 25.81 24.37 33.94 47.58 37.42 47.87 24.08 24.37 
24.60 26.06 24.30 35.72 47.43 38.06 48.31 23.72 24.60
25.12 25.12 24.23 34.87 50.24 37.53 48.76 23.94 26.00
24.17 24.77 24.47 35.21 51.03 37.00 49.83 24.47 27.45
24.09 25.90 24.09 35.54 49.09 38.55 50.90 25.30 27.41
25.54 26.46 26.76 35.88 49.26 38.62 50.48 24.33 26.76
26.08 26.38 27.61 36.51 50.32 39.27 49.70 23.93 27.00
28.76 27.84 27.22 36.19 51.34 38.04 49.18 24.12 26.60 
28.98 27.73 28.36 38.64 51.10 39.26 47.36 24.30 26.17
28.56 28.88 28.56 37.35 51.16 39.55 48.97 24.48 26.37
28.76 29.39 26.87 37.30 51.84 40.46 48.99 24.97 27.50
29.61 27.70 28.02 36.62 50.63 39.48 49.03 26.43 31.20
26.94 26.62 27.58 36.24 49.39 39.45 52.27 28.54 33.67
27.79 25.20 25.20 36.83 51.05 39.74 52.66 27.79 37.16
27.31 25.36 24.38 36.74 50.39 39.34 52.99 28.28 40.64
27.12 24.51 23.53 35.62 51.63 40.85 54.25 29.41 40.20
23.97 22.98 21.99 34.80 50.88 39.07 56.14 30.86 47.93
25.19 24.53 22.54 35.14 50.39 40.77 54.69 30.83 47.07
26.89 24.57 23.90 32.87 50.79 39.51 54.44 30.88 47.14
26.99 23.99 24.66 34.66 52.99 40.66 55.66 30.99 42.99
24.78 22.43 23.10 34.49 52.57 40.52 56.93 31.82 48.23
"))

num_species <- ncol(X)
n <- nrow(X)
dt <- 1
tau_index <- 1

# --- Drift estimation (alpha, A) ---
X_now <- X[1:(n - tau_index), ]
X_tau <- X[(1 + tau_index):n, ]
Y <- (X_tau - X_now) / dt

alpha_est <- numeric(num_species)
A_est <- matrix(0, nrow = num_species, ncol = num_species)

for (i in 1:num_species) {
  y_i <- Y[, i]
  x_i <- X_now[, i]
  response <- c(mean(y_i), colMeans(sweep(X_now, 1, y_i, FUN = "*")))
  G <- matrix(0, nrow = num_species + 1, ncol = num_species + 1)
  G[1, 1] <- mean(x_i)
  G[1, 2:(num_species + 1)] <- colMeans(sweep(X_now, 1, x_i, FUN = "*"))
  G[2:(num_species + 1), 1] <- G[1, 2:(num_species + 1)]
  for (j in 1:num_species) {
    for (k in 1:num_species) {
      G[j + 1, k + 1] <- mean(X_now[, j] * X_now[, k] * x_i)
    }
  }
  sol <- solve(G, response)
  alpha_est[i] <- sol[1] / dt
  A_est[i, ] <- -sol[-1] / dt
}

# --- Diffusion estimation ---
dX <- X_tau - X_now
Y_ij <- matrix(0, nrow=num_species, ncol=num_species)
for (i in 1:num_species) {
  for (j in 1:num_species) {
    Y_ij[i, j] <- mean(dX[, i] * dX[, j])
  }
}
XX <- matrix(0, nrow=num_species, ncol=num_species)
for (i in 1:num_species) {
  for (j in 1:num_species) {
    XX[i, j] <- mean(X_now[, i] * X_now[, j])
  }
}
d_matrix <- Y_ij / (XX * dt)

# --- Write A_est and d_matrix in triplet form ---
write_triplet <- function(mat, filename) {
  triplet <- data.frame(
    i = rep(1:nrow(mat), each = ncol(mat)),
    j = rep(1:ncol(mat), times = nrow(mat)),
    value = as.vector(mat)
  )
  write.table(triplet, file = filename, row.names = FALSE, col.names = FALSE,
              quote = FALSE, sep = "\t")
}

write_triplet(A_est, "~/Desktop/A_est_triplets.txt")
write_triplet(d_matrix, "~/Desktop/d_matrix_triplets.txt")

cat("Saved A_est and d_matrix triplets to Desktop.\n")

# --- Optional: save a description of your analysis ---
theory_text <- "
9D system drift (A_est) and diffusion (d_matrix) estimated from time-series data.
State-dependent diffusion: D^(2)_ij(x) = d_ij * x_i * x_j
"
writeLines(theory_text, "~/Desktop/9D_system_description.txt")
cat("Saved description to Desktop.\n")


# --- Assume previous code already computed alpha_est, A_est, d_matrix ---

# --- Save alpha_est ---
alpha_triplets <- data.frame(
  i = 1:length(alpha_est),
  alpha = alpha_est
)
write.table(alpha_triplets, file="~/Desktop/alpha_est.txt",
            row.names = FALSE, col.names = FALSE, quote = FALSE, sep="\t")
cat("Saved alpha_est to Desktop.\n")

# --- Compute fixed point x* ---
# Solve A_est x* = alpha_est => x* = solve(A_est, alpha_est)
x_star <- solve(A_est, alpha_est)
x_star_triplets <- data.frame(
  i = 1:length(x_star),
  x_star = x_star
)
write.table(x_star_triplets, file="~/Desktop/x_star.txt",
            row.names = FALSE, col.names = FALSE, quote = FALSE, sep="\t")
cat("Saved fixed point x* to Desktop.\n")

# --- Compute Jacobian at x* ---
J_star <- -diag(as.vector(x_star)) %*% A_est

# --- Save Jacobian triplets ---
J_triplets <- data.frame(
  i = rep(1:nrow(J_star), each = ncol(J_star)),
  j = rep(1:ncol(J_star), times = nrow(J_star)),
  value = as.vector(J_star)
)
write.table(J_triplets, file="~/Desktop/Jacobian_triplets.txt",
            row.names = FALSE, col.names = FALSE, quote = FALSE, sep="\t")
cat("Saved Jacobian at x* to Desktop.\n")

# --- Compute and save eigenvalues ---
eigvals <- eigen(J_star)$values
eigvals_df <- data.frame(
  Re = Re(eigvals),
  Im = Im(eigvals)
)
write.table(eigvals_df, file="~/Desktop/Jacobian_eigenvalues.txt",
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep="\t")
cat("Saved eigenvalues of Jacobian to Desktop.\n")
