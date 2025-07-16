## 📁 Node-RED

This is the **Node-RED** directory for flow-based automation logic.

It includes everything needed to persist flows, customize the environment, and extend Node-RED using volumes.

---

### 📂 Volume Structure

| Path | Purpose |
| --- | --- |
| `volume/data/` | Node-RED runtime data (e.g. credentials, npm cache, runtime settings) |m
| `volume/flows/` | Stores your Node-RED flows (`flows.json`) |
| `volume/certs/` | TLS certificates for secure OPC UA or HTTPS |
| `volume/custom-nodes/` | Optional custom Node-RED nodes (installed on startup) |
| `volume/custom-icons/` | Optional custom icon files (SVG/PNG) for UI nodes |
| `volume/settings.js` | Custom `settings.js` file loaded at runtime |

---

### ⚙️ Customization

-   **Custom Nodes**:  
    Place your Node-RED nodes (npm packages or local folders) in `volume/custom-nodes/`. These will be installed at container startup if the `FORCE_REINSTALL=true` environment variable is set.
    
-   **Custom Icons**:  
    Any icons placed in `volume/custom-icons/` can be referenced by custom nodes or used in the UI.
    
-   **Certificates**:  
    Add OPC UA server/client or HTTPS certs to `volume/certs/` and reference them from your flows or configuration.
    
-   **Settings**:  
    The file `volume/settings.js` overrides the default Node-RED settings file and allows full customization (security, context storage, logging, etc.).
    

---

### 🔁 Reinstall Custom Nodes

To force reinstallation of custom nodes on container startup:

```bash
FORCE_REINSTALL=true docker-compose up -d --build
```

This is useful when developing custom nodes or making changes in `volume/custom-nodes/`.

---

### 📝 Default Flow

If `volume/flows/flows.json` is missing, it is auto-populated from `flows.json.default`.

---