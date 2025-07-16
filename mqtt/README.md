## 📁 MQTT

This is the **MQTT (Mosquitto)** directory used by the `databus` service.

### 📂 Volume Structure

-   `volume/config/`  
    Place your custom:
    
    -   `mosquitto.conf` – main Mosquitto configuration
        
    -   `acl.conf` – access control list for MQTT topics
        
-   `volume/certs/`  
    Optional directory to store your own TLS certificates if you want to enable secure MQTT (`8883`) or WebSocket Secure (`8083`).
    
-   `volume/credentials/`  
    Will contain the `passwd` file generated automatically at container startup using the environment variables `MQTT_USER` and `MQTT_PASS`.
    

### ⚙️ Notes

-   You can **edit or override** the default configs placed in `volume/config/` after the first run.
    
-   TLS is optional but supported—just drop your certs in `volume/certs/` and adjust `mosquitto.conf`.
    

### ✅ Example

By default, startup will:

-   Generate `passwd` from `MQTT_USER=admin`, `MQTT_PASS=adminPassword`
    
-   Use config files from `volume/config/`
    
-   Expose ports `1883`, `8883`, and `8083`
    

---