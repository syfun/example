package hub

// Message transfer action and data with client.
type Message struct {
	Action string      `json:"action"`
	Data   interface{} `json:"data,omitempty"`
}

// handleMessage
func handleMessage(msg *Message) {
	logger.Info(msg)
	// TODO
}
