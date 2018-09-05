package main

import (
	"fmt"
	"path"
)

// Base for path.Base demo.
func Base() {
	fmt.Println(path.Join("a", "b", "c"))
	fmt.Println(path.Join("a", "b/c"))
	fmt.Println(path.Join("a/b", "c"))
	fmt.Println(path.Join("a/b", "/c"))
	paths := []string{"", "/", "/a/b/"}
	for _, p := range paths {
		fmt.Printf("path.Base(%q) => %q\n", p, path.Base(p))
	}
}

// Clean for path.Clean demo.
func Clean() {
	paths := []string{
		"a/c",
		"a//c",
		"a/c/.",
		"a/c/b/..",
		"/../a/c",
		"/../a/b/../././/c",
	}

	for _, p := range paths {
		fmt.Printf("Clean(%q) = %q\n", p, path.Clean(p))
	}
}

func main() {
	fmt.Println("path")
}
