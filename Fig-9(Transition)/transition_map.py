# Code written by Roshan Singh

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d
from scipy.ndimage import gaussian_filter
from matplotlib.colors import LinearSegmentedColormap, BoundaryNorm

path = "N_vs_Kf_new.dat"

data = np.loadtxt(path, delimiter=None)  # `None` or whitespace by default

x = np.log(data[:, 0])       # log of first column
y1 = data[:, 1]              # second column
error_1 = data[:, 2]         # third column
y2 = data[:, 3]              # fourth column
error_2 = data[:, 4]         # fifth column

# Interpolate x and y values to get a smooth 500-point grid
x_interp = np.linspace(x.min(), x.max(), 500)
y1_interp = interp1d(x, y1, kind='linear')(x_interp)
y2_interp = interp1d(x, y2, kind='linear')(x_interp)

error_1_interp = interp1d(x, error_1, kind='linear')(x_interp)

error_2_interp = interp1d(x, error_2, kind='linear')(x_interp)

# Define y range and create a 500-point grid for y

y_min, y_max = 0, 2
y_values = np.linspace(y_min, y_max, 500)
X, Y = np.meshgrid(x_interp, y_values)

# Create Z values with a smooth continuous transition between y1 and y2
Z = np.zeros_like(X)

for i, (y1_val, err_val_1, y2_val, err_val_2) in enumerate(zip(y1_interp, error_1_interp, y2_interp, error_2_interp)):
    # Define the transition function smoothly
    Z[:, i] = np.where(Y[:, i] < y1_val, 
                       1 + 0.1 * np.exp(-((Y[:, i] - y1_val) / err_val_1)**2),  # Region 1 smooth transition
                       np.where(Y[:, i] < y2_val,
                                2 + 0.1 * np.exp(-((Y[:, i] - (y1_val + y2_val) / 2) / (err_val_2))**2),  # Transition region
                                3 - 0.1 * np.exp(-((Y[:, i] - y2_val) / err_val_2)**2)))  # Region 3 smooth transition

# Apply Gaussian filter to further smoothen transitions
Z = gaussian_filter(Z, sigma=3)  # Adjust sigma for desired smoothing effect

#colors = ["SkyBlue", "DodgerBlue", "SteelBlue"]
colors = ["#D4A5A5","#A9C4A9", "#9BAFD9"]
#colors = ["#83A3A1","#A8BBA8", "#CAB8C8"]
#colors = ["#F2E2C1","#F4C2B4","#C9D4B9"]
cmap = LinearSegmentedColormap.from_list("custom_cmap", colors, N=500)

# Define a continuous colormap
plt.figure(figsize=(10, 8), dpi=500)
#cmap = plt.get_cmap('RdYlBu')  # You can change to any smooth colormap
#cmap = plt.get_cmap('Set1')
plt.imshow(Z, extent=[x_interp.min(), x_interp.max(), y_min, y_max], origin='lower', aspect='auto', cmap=cmap)

# Overlay y1 and y2 as lines
plt.plot(x_interp, y1_interp, color="coral", linestyle="--", linewidth=0.8, label="y1")
plt.plot(x_interp, y2_interp, color="cadetblue", linestyle="--", linewidth=0.8, label="y2")

bounds = [0.5, 1.5, 2.5, 3.5]
norm = BoundaryNorm(bounds, cmap.N)
cbar = plt.colorbar(ticks=[1.18, 1.99, 2.98])
#cbar.set_ticks([0, 1, 2])
cbar.set_ticklabels(['Random', 'Rotation', 'Static'],rotation=90, fontsize=16)
#cbar.set_label("Regions")


# Customize labels, title, and ticks
plt.xlabel(r"log(N)", fontsize=16)
plt.ylabel(r"$K_F$", fontsize=16)
#plt.title(r"Transition Map", fontsize=18)
plt.xticks(fontsize=18)
plt.yticks(fontsize=18)

# Add a legend for the lines
#plt.legend(loc="upper right", fontsize=12)

# Save the plot
plt.savefig("transition.png", format='png', bbox_inches='tight')

# Display the plot
plt.show()