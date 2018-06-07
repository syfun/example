import (
	"bufio"
	"errors"
	"fmt"
	"net"
)

type connection struct {
	addr *net.TCPAddr
	conn net.Conn
}

// connPool is net.Conn pool.
type connPool chan connection

var pool connPool
var errPool connPool

// ClosePool colse connection pool.
func ClosePool() {
	for conn := range pool {
		conn.conn.Close()
	}
}

func reconnect() {
	for {
		select {
		case conn := <-errPool:
			var err error
			conn.conn, err = net.DialTCP("tcp", nil, conn.addr)
			if err != nil {
				// logger.Error("cannot connect %s: %s", conn.addr.String(), err.Error())
				errPool <- conn
				continue
			}
			pool <- conn
		}
	}
}

func initConnPool(hosts []string) {
	pool = make(connPool, len(hosts))
	errPool = make(connPool, len(hosts))
	go reconnect()

	for _, host := range hosts {
		tcpAddr, err := net.ResolveTCPAddr("tcp4", host)
		if err != nil {
			logger.Error("%s", err)
		}
		logger.Info("connect %s", tcpAddr.String())
		conn, err := net.DialTCP("tcp", nil, tcpAddr)
		if err != nil {
			logger.Error("cannot connect %s: %s", tcpAddr.String(), err.Error())
			errPool <- connection{tcpAddr, nil}
			continue
		}
		if err := conn.SetKeepAlive(true); err != nil {
			logger.Warning("cannot set keepalive for %s", tcpAddr.String())
		}

		pool <- connection{tcpAddr, conn}
	}
}
