package main

import (
	"crypto/hmac"
	"crypto/md5"
	"crypto/sha1"
	"encoding/base64"
	"fmt"
)

// Base64MD5 for caculating string's md5 and convert to base64.
func Base64MD5(str string) string {
	h := md5.New()
	h.Write([]byte(str))
	return base64.StdEncoding.EncodeToString(h.Sum(nil))
}

// HmacSha1 for caculating string's hmac with sha1, and convert to base64.
func HmacSha1(str string, key string) string {
	h := hmac.New(sha1.New, []byte(key))
	h.Write([]byte(str))
	return base64.StdEncoding.EncodeToString(h.Sum(nil))
}

func main() {
	fmt.Println("Crypto")
}
