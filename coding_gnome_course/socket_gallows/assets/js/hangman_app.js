import HangmanSocket from "./hangman_socket.js"

window.onload = function() {
    let hangman = new HangmanSocket()
    hangman.connectToHangman()
}
