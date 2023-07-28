package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"strings"
)

type importantStuff struct {
	Whatpoint string `json:"what_point"`
}

func main() {
	flag, err := os.ReadFile("flag.txt")
	if err != nil {
		panic(err)
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			fmt.Fprint(w, "你好世界")
			return
		case http.MethodPost:
			body, err := io.ReadAll(r.Body)
			if err != nil {
				fmt.Fprintf(w, "寄了")
				return
			}

			if strings.Contains(string(body), "what_point") || strings.Contains(string(body), "\\") {
				fmt.Fprintf(w, "寄了")
				return
			}

			var whatpoint importantStuff
			err = json.Unmarshal(body, &whatpoint)
			if err != nil {
				fmt.Fprintf(w, "寄了")
				return
			}

			if whatpoint.Whatpoint == "that_point" {
				fmt.Fprintf(w, "好耶: %s", flag)
				return
			} else {
				fmt.Fprintf(w, "寄了")
				return
			}
		default:
			fmt.Fprint(w, "不许")
			return
		}
	})

	log.Fatal(http.ListenAndServe(":9999", nil))

}
