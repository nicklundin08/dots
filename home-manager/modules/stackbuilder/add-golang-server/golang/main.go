package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	// Optional: for using http.StatusOK etc.
)

func main() {
	// Create a Gin router with default middleware (logger and recovery)
	router := gin.Default()

	// Define a GET endpoint
	router.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{ // Use http.StatusOK for clarity
			"message": "pong",
		})
	})

	// Run the server, listening on 0.0.0.0:8080 by default
	router.Run()
}
