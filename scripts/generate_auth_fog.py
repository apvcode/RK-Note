"""Generate the transparent fog overlay used by the authorization mock-up."""

from pathlib import Path

import numpy as np
from PIL import Image, ImageFilter


WIDTH, HEIGHT = 864, 1821
OUTPUT = (
    Path(__file__).resolve().parents[1]
    / "mod/res/drawable-nodpi/auth_fog.png"
)

rng = np.random.default_rng(41)
x = np.linspace(0, 1, WIDTH, dtype=np.float32)[None, :]
y = np.linspace(0, 1, HEIGHT, dtype=np.float32)[:, None]

noise = Image.fromarray(rng.integers(0, 256, (25, 15), dtype=np.uint8))
noise = noise.resize((WIDTH, HEIGHT), Image.Resampling.BICUBIC)
noise = noise.filter(ImageFilter.GaussianBlur(18))
texture = np.asarray(noise, dtype=np.float32) / 255

bands = (
    0.80 * np.exp(-((y - 0.105 - 0.025 * np.sin(10 * x)) / 0.055) ** 2)
    + 0.62 * np.exp(-((y - 0.34 + 0.04 * np.sin(8 * x + 1.7)) / 0.075) ** 2)
    + 0.45 * np.exp(-((y - 0.62 - 0.035 * np.sin(11 * x + 0.4)) / 0.065) ** 2)
)
texture = np.clip((texture - 0.34) * 2.3, 0, 1)
alpha = np.uint8(np.clip(bands * texture * 95, 0, 90))

rgba = np.empty((HEIGHT, WIDTH, 4), dtype=np.uint8)
rgba[:, :, :3] = (212, 225, 220)
rgba[:, :, 3] = alpha

OUTPUT.parent.mkdir(parents=True, exist_ok=True)
Image.fromarray(rgba, "RGBA").save(OUTPUT, optimize=True)
print(OUTPUT)

