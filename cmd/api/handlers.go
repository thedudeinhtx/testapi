package main

import (
	"net/http"
)

func (app *Config) Default(w http.ResponseWriter, r *http.Request) {
	payload := jsonResponse{
		Error:   false,
		Message: "Hit the api",
	}

	_ = app.writeJSON(w, http.StatusOK, payload)

}
