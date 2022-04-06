package main

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/aws/aws-lambda-go/lambda"
)

type Request struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

type Response struct {
	OK   bool      `json:"ok"`
	Time time.Time `json:"time"`
}

func Login(ctx context.Context, req Request) (Response, error) {
	select {
	case <-ctx.Done():
		return Response{OK: false, Time: time.Now()}, ctx.Err()
	default:
	}

	log.Printf("%+v\n", req)

	if req.Username != "hello" || req.Password != "world" {
		return Response{OK: false, Time: time.Now()}, fmt.Errorf("invalid attempt")
	}

	return Response{OK: true, Time: time.Now()}, nil
}

func main() {
	lambda.Start(Login)
}
