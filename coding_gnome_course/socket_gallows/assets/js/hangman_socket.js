import {Socket} from "phoenix"

export default class HangmanSocket {

    constructor() {
        this.socket = new Socket("/socket", {})
        this.socket.connect()
    }

    connectToHangman() {
        this.setupChannel()
        this.channel.on("tally", tally => {
            console.log(tally)
        })
    }

    setupChannel() {
        this.channel = this.socket.channel("hangman:game", {})
        this.channel
            .join()
            .receive("ok", resp => {
                this.fetchTally()
            })
            .receive("error", resp => {
                alert(resp)
                throw(resp)
            })
    }

    fetchTally() {
        this.channel.push("tally", {})
    }

}
