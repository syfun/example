## Golang error处理

### Links

- [Best Practices for Errors in Go](https://justinas.org/best-practices-for-errors-in-go)
- [Error handling patterns in Go](https://mijailovic.net/2017/05/09/error-handling-patterns-in-go/)
- [Don’t just check errors, handle them gracefully](https://dave.cheney.net/2016/04/27/dont-just-check-errors-handle-them-gracefully)
- [What I Don’t Like About Error Handling in Go, and How to Work Around It](https://opencredo.com/why-i-dont-like-error-handling-in-go/)
- [My Go Resolutions for 2017](https://research.swtch.com/go2017)
- [Errors are values](https://blog.golang.org/errors-are-values)
- [Don’t just check errors, handle them gracefully](https://dave.cheney.net/2016/04/27/dont-just-check-errors-handle-them-gracefully)

### Packages

- [errors](https://github.com/pkg/errors)

### Principal

- Error as a value
- Always check but do nice
- Predefine errors
    - fmt.Errorf()
    - errors.New()
    - struct error
- Centralised Error handling
- Do not use panic, unless
    - Setting up or Init
    - Important part failed
