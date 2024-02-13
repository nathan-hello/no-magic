package routes

import (
	"net/http"
	"strconv"

	"github.com/nathan-hello/no-magic/scaffold/components"
)

func Counter(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodGet {
		components.Counter().Render(r.Context(), w)
	}
	if r.Method == http.MethodPost {
		input := r.FormValue("new-count")
		newCount, err := strconv.Atoi(input)
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			return
		}
		components.CurrentCount(newCount)
	}
}
