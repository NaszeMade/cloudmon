package main

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"
)

type Alert struct {
    Metric string  `json:"metric"`
    Value  float64 `json:"value"`
}

func remediateHandler(w http.ResponseWriter, r *http.Request) {
    var alert Alert
    err := json.NewDecoder(r.Body).Decode(&alert)
    if err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }
    log.Printf("Remediation triggered for %s with value %f\n", alert.Metric, alert.Value)
    fmt.Fprint(w, "Remediation complete.")
}

func main() {
    http.HandleFunc("/remediate", remediateHandler)
    log.Println("Remediation service running on :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}