package main

import (
	"encoding/json"
	"fmt"
	"log"
)

// Example for test.
type Example struct {
	Field1 string `json:"field1"`
	Field2 string `json:"field2,omitempty"`
	Field3 string `json:",omitempty"`
	Field4 string `json:"-"`
	Field5 string `json:"-,"`
	Field6 int    `json:"field6,string"`
	Field7 string
	other  string
}

// MarshalStruct marshal struct.
func MarshalStruct() {
	example1 := Example{"field1", "field2", "field3", "field4", "field5", 10, "field7", ""}
	example2 := Example{"field1", "", "", "field4", "field5", 20, "field7", ""}
	b1, _ := json.Marshal(example1)
	b2, _ := json.Marshal(example2)
	fmt.Println(string(b1))
	fmt.Println(string(b2))
}

// MarshalJSON example implement Marshaler.
func (example *Example) MarshalJSON() ([]byte, error) {
	type Alias Example
	return json.Marshal(struct {
		Other string
		*Alias
	}{
		example.other,
		(*Alias)(example),
	})
}

// MarshalText example implement encoding.TextMarshaler
func (example *Example) MarshalText() ([]byte, error) {
	return []byte(example.Field1), nil
}

// Any represent any type.
type Any interface{}

// MarshalMap marshal map.
func MarshalMap() {
	exmaple := Example{"field1", "field2", "field3", "field4", "field5", 10, "field7", ""}
	m := map[Example]string{
		// 1:       "1",
		// "2":     "2",
		exmaple: "example",
	}
	b, err := json.Marshal(m)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(string(b))
}

func main() {
	MarshalStruct()
	MarshalMap()
}
