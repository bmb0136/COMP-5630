print("## Conditional Probabilities")
print()
print("| Feature | Class | Values | Conditional Probability |")
print("|-|-|-|-|")
data = {}
for c in CLASSES:
    for f in FEATURE_COLS:
        vals = np.array([x for x, y in zip(df_train[f], df_train[TARGET_COL]) if y == c])
        mu = np.mean(vals)
        std = np.std(vals)
        print(f"| {f} | {c} | {", ".join(map(lambda x: f"${x}$", vals))} | $\\mu=\\frac{{{"+".join(map(str, vals))}}}{{{len(vals)}}}={mu:.3f}$; $\\sigma=\\frac{{{"+".join(map(lambda x: f"({x}-{mu:.3f})^2", vals))}}}{{{len(vals)}-1}}={std:.3f}$; $P=\\frac{{1}}{{\\sqrt{{2\\pi\\cdot{std:.3f}^2}}}}\\exp\\left(-\\frac{{(x-{mu:.3f})^2}}{{2({std:.3f})^2}}\\right)$ |")
        data[(c, f)] = (round(float(mu), 3), round(float(std), 3))
print()
print(data)