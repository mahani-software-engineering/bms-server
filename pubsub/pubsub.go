package pubsub


import (
    "github.com/gorilla/websocket"
)

type Pubsub struct {
  subs   map[string][]chan string
  closed bool
}

func NewPubsub() *Pubsub {
  ps := &Pubsub{}
  ps.subs = make(map[string][]chan string)
  return ps
}

var pubsubBroker *Pubsub = pubsub.NewPubsub()

var upgrader = websocket.Upgrader{} //use default options 

func (ps *Pubsub) Close() {
  if !ps.closed {
    ps.closed = true
    for _, subs := range ps.subs {
      for _, ch := range subs {
        close(ch)
      }
    }
  }
}

//publishing
func (ps *Pubsub) Publish(topic string, msg string) {
  if ps.closed {
    return
  }
  subscribers := ps.subs[topic]
  for _, ch := range subscribers {
       ch <- msg
  }
}

//subscribing
func (ps *Pubsub) Subscribe(topic string) chan string {
  ch := make(chan string, 10)
  ps.subs[topic] = append(ps.subs[topic], ch)
  return ch
}





