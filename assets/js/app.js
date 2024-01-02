import css from '../css/app.css'
import "phoenix_html"
import $ from 'jquery'
import 'bootstrap'
import 'bootstrap/js/dist/util'
import 'bootstrap/js/dist/dropdown'
import socket from "./socket"
import Video from "./video"

window.jQuery = $
window.$ = $

Video.init(socket, document.getElementById("video"))