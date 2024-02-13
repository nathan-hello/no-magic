package routes

import (
	"net/http"

	"github.com/nathan-hello/no-magic/scaffold/components"
)

func Root(w http.ResponseWriter, r *http.Request) {
	components.LandingPage().Render(r.Context(), w)
}
