package main

import (
	"fmt"
	"net/http"
	"os"
)

func hello(w http.ResponseWriter, req *http.Request) {
	fmt.Fprint(w, "Hello World\n")
}

func main() {
	fmt.Println("Hello World")

	port, found := os.LookupEnv("PORT")
	if !found {
		port = "8080"
	}

	http.HandleFunc("/", hello)

	http.ListenAndServe(":"+port, nil)
}
