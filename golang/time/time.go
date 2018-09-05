package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"time"
)

var defaultFormatter = "2006-01-02 15:04:05"

var ts2str = flag.NewFlagSet("ts2str", flag.ExitOnError)
var str2ts = flag.NewFlagSet("str2ts", flag.ExitOnError)
var ts int64
var formatter string
var timeStr string

func init() {
	ts2str.Int64Var(&ts, "ts", 0, "timestamp to convert to time.")
	ts2str.StringVar(&formatter, "f", "2006-01-02 15:04:05", "time formatter.")

	str2ts.StringVar(&timeStr, "str", "2006-01-02 15:04:05", "time string to convert to timestamp.")
	str2ts.StringVar(&formatter, "f", "2006-01-02 15:04:05", "time formatter.")
}

func usage() {
	helpStr := `
Usage of %s:
  %s COMMAND

COMMAND:
  ts2str:	convert timestamp to time.

  str2ts:	convert time string to timestamp.

`
	fmt.Fprintf(os.Stderr, helpStr, os.Args[0], os.Args[0])
}

// Ts2TimeString ...
func Ts2TimeString(formatter string, ts int64) string {
	t := time.Unix(ts, 0)
	return t.Format(formatter)
}

// TimeString2TS ...
func TimeString2TS(formatter, value, loc string) int64 {
	local, err := time.LoadLocation(loc)
	if err != nil {
		log.Panic(err)
	}
	t, err := time.ParseInLocation(formatter, value, local)
	if err != nil {
		log.Panic(err)
	}
	return t.Unix()
}

func main() {
	if len(os.Args) < 2 {
		usage()
		return
	}
	switch os.Args[1] {
	case "ts2str":
		err := ts2str.Parse(os.Args[2:])
		if err != nil {
			log.Panic(err)
		}
		fmt.Fprintln(os.Stderr, Ts2TimeString(formatter, ts))
	case "str2ts":
		err := str2ts.Parse(os.Args[2:])
		if err != nil {
			log.Panic(err)
		}
		fmt.Fprintln(os.Stderr, TimeString2TS(formatter, timeStr, "Local"))
	default:
		usage()
	}
}
