# 💃 d3-Lapdance Script for FiveM

Welcome to the official **d3-Lapdance** script for your FiveM server! Spice up your club scenes with this immersive and animated lap dance experience 🎉

---

## ✨ Features

- 💸 Pay $250 for a lap dance
- 💃 Fully animated lap dance sequence
- 👀 Camera and player control disabled during the dance for immersion
- ⏳ Cooldown system to prevent spam
- ❌ Automatic cleanup and reset after the dance
- 🔞 NSFW Script (Nudity)

---

## ⚙️ Dependencies

- ✅ [QBCore / qb-core](https://github.com/qbcore-framework/qb-core)
- 🎯 Recommended: `qb-target` support for interaction (not required)

---

## 🧠 How It Works

1. Player pays for a lap dance via event or target.
2. A stripper NPC spawns and performs a choreographed lap dance.
3. The player is moved to the correct position and plays seated animations.
4. After the show, the NPC leaves and the area resets.

---

## 📦 Installation

1. Download or clone this repository to your `resources/d3-lapdance`.
2. Add this to your `server.cfg`:

   ```cfg
   ensure d3-lapdance


## 🧪 Usage
You can trigger the lap dance with:


```TriggerServerEvent('d3-lapdance:buy')```
Or
```

        options = {
            {
				type = "client", 
				event = "d3-lapdamce:paybitch",
				icon = 'fas fa-money-bill-1-wave',
				label = 'Pay For Lapdnace', 
            },
        },

