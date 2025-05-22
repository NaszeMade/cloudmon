import yaml
import time
import psutil
import requests

def load_config():
    with open("config.yaml", 'r') as file:
        return yaml.safe_load(file)

def monitor_cpu(threshold):
    cpu = psutil.cpu_percent(interval=1)
    print(f"CPU Usage: {cpu}%")
    if cpu > threshold:
        trigger_remediation("cpu", cpu)

def trigger_remediation(metric, value):
    requests.post("http://localhost:8080/remediate", json={
        "metric": metric,
        "value": value
    })

if __name__ == "__main__":
    config = load_config()
    while True:
        monitor_cpu(config["thresholds"]["cpu"])
        time.sleep(10)