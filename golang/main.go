package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	_ "github.com/lib/pq"
)

func main() {
	connStr := "postgres://myuser:mypassword@postgres:5432/mydb?sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		var now string
		err := db.QueryRow("SELECT NOW()").Scan(&now)
		if err != nil {
			http.Error(w, err.Error(), 500)
			return
		}
		fmt.Fprintf(w, "Current time: %s", now)
	})

	log.Println("Golang server started on port 3002")
	http.ListenAndServe(":3002", nil)
}
