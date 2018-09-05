package main

import (
	"fmt"
	"image"
	"image/color"
	"log"
	"os"

	_ "image/jpeg"
	_ "image/png"
)

func main() {
	f, err := os.Open("/Users/ysun/workspace/go/src/github.com/teletraan/frls/test_images/face_02.jpg")
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	img, _, err := image.Decode(f)
	log.Println("####")
	log.Println(img.Bounds(), img.ColorModel(), err, color.YCbCrModel)
	fmt.Printf("%T", img.ColorModel().Convert(color.NRGBA{}))
}
