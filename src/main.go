package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"google.golang.org/appengine"
)

func main() {
	// check running server
	if appengine.IsDevAppServer() {
		log.Print("dev server")
	} else {
		log.Print("gae server")
	}

	// routing
	r := mux.NewRouter()
	r.HandleFunc("/hello", getHello).Methods("GET")
	http.Handle("/", r)
	appengine.Main()
}

// [GET] /hello
func getHello(w http.ResponseWriter, r *http.Request) {
	json.NewEncoder(w).Encode(map[string]interface{}{
		"result": "hello",
	})
}
