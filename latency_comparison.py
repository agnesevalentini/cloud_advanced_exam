import matplotlib.pyplot as plt

# Data
architectures = ['VM', 'Container', 'veth', 'veth+bridge', 'veth+bridge+vxlan']
avg_latency = [1.2, 0.2, 0.1, 0.1, 0.2]
stdev_latency = [0.3, 0.1, 0.0, 0.0, 0.1]

# Plot
plt.figure(figsize=(10, 6))
plt.errorbar(architectures, avg_latency, yerr=stdev_latency, fmt='o-', capsize=5, linewidth=2)

# Labels and title
plt.xlabel('Network Architecture')
plt.ylabel('Average Latency (ms)')
plt.title('Latency comparison')
plt.grid(True)
plt.tight_layout()

plt.show()
