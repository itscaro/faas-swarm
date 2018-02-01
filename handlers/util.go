package handlers

import (
	"fmt"
	"os"
)

var isDebug = false

func init() {
	if val, exists := os.LookupEnv("debug"); exists && (val == "1" || val == "true") {
		isDebug = true
	}
}

// debug prints out debug message
func debug(format string, a ...interface{}) {
	if isDebug {
		fmt.Printf(format, a...)
	}
}
