## 📦 iiot-automation

**iiot-automation** is a lightweight, modular Industrial IoT automation stack powered by Docker Compose. It brings together essential tools for automation prototyping and deployment, including:

-   🟢 Node-RED – flow-based automation logic
    
-   📡 Mosquitto – MQTT messaging broker
    
-   🖥️ FUXA – HMI/SCADA web-based interface
    

Ideal for industrial edge simulations, prototyping with OPC UA/MQTT, or preparing logic before migrating to a real PLC (e.g. Siemens S7-1200).

---

## 🧱 Stack Overview

| Service | Description | Port(s) |
| --- | --- | --- |
| `databus` | Mosquitto MQTT broker | 1883, 8883, 8083 |
| `node-red` | Flow-based automation engine | 1880, 54840 (custom OPC UA), 14840 |
| `fuxa` | Web-based SCADA/HMI (Frangoteam FUXA) | 1881 |

---

## 🗂 Folder Structure

```csharp
iiot-automation/
├── docker-compose.yml
├── init.sh                     # Initializes all volume folders
├── mqtt/
│   ├── volume/                 # Mosquitto certs/configs/credentials
│   ├── config/                 # Default Mosquitto config
├── node-red/
│   ├── volume/                 # Node-RED data, custom nodes, flows, certs
│   ├── scripts/                # Node-RED preparation scripts
│   ├── settings.js.default     # Default Node-RED settings
│   └── flows.json.default      # Default Node-RED flow
├── fuxa/
│   └── volume/                 # FUXA appdata, db, logs, images
```

---

## 🚀 Getting Started

### 1\. Clone the repo

```bash
git clone https://github.com/CuAuPro/iiot-automation.git
cd iiot-automation
```

### 2\. Initialize stack

Run this before starting containers (once per machine or after cleanup):

```bash
./init.sh
```

This script creates required folders and copies default config files (if missing).

After that modify `.env` file.

### 3\. Start services

```bash
docker-compose up -d --build
```

### 4\. Access services

| Tool | URL |
| --- | --- |
| Node-RED | [http://localhost:1880](http://localhost:1880) |
| FUXA | [http://localhost:1881](http://localhost:1881) |
| MQTT | mqtt://localhost:1883 |

---

## ⚙️ Configuration

### Node-RED

-   Mounts flow definitions, certs, and optional custom nodes/icons from `node-red/volume/*`
    
-   `settings.js` is loaded from volume and can be customized
    
-   To force re-install custom nodes: `FORCE_REINSTALL=true docker-compose up`
    

### MQTT (Mosquitto)

-   Uses `mosquitto.conf` and `acl.conf` from `mqtt/volume/config/`
    
-   Supports secure certs via `mqtt/volume/certs/` if configured
    

### FUXA

-   Stores projects, logs, databases, and images in the mounted `fuxa/volume` directories
    

---

## 🧪 Dev Tips

-   Use Node-RED to simulate I/O logic and connect via MQTT/OPC UA
    
-   Create flows in Node-RED and persist them via `flows/flows.json`
    
-   FUXA can be used as a dashboard or mock SCADA interface
    

---

