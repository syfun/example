package hub

import (
	"net/http"

	"github.com/gorilla/websocket"
)

var logger = GetLogger("hub")

// Hub maintains the set of active clients and broadcasts messages to the
// clients.
type Hub struct {
	// Registered clients.
	clients map[*Client]bool

	// // Inbound messages from the clients.
	// broadcast chan []byte

	// Register requests from the clients.
	register chan *Client

	// Unregister requests from clients.
	unregister chan *Client
}

// New create new hub.
func New() *Hub {
	return &Hub{
		register:   make(chan *Client),
		unregister: make(chan *Client),
		clients:    make(map[*Client]bool),
	}
}

// Run hub.
func (h *Hub) Run() {
	for {
		select {
		case client := <-h.register:
			h.clients[client] = true
		case client := <-h.unregister:
			if _, ok := h.clients[client]; ok {
				delete(h.clients, client)
				close(client.send)
			}
		}
	}
}

var upgrader = websocket.Upgrader{}

// WsHandler for web socket handler to gin.
func (h *Hub) WsHandler(w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		logger.Errorf("Failed to set websocket upgrade: %+v", err)
		return
	}
	client := &Client{hub: h, conn: conn, send: make(chan *Message)}
	client.hub.register <- client

	logger.Info("connected ...")
	go client.readPump()
	go client.writePump()
}
