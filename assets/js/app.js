// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import 'bootstrap/dist/css/bootstrap.min.css';
import propper from '@popperjs/core'
import { Dropdown } from 'bootstrap'
import css from "../css/app.css";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
document.addEventListener('DOMContentLoaded', () => {
  const radioElementList = document.querySelectorAll('.radio-chips')
  const audioTag = document.getElementById('native-audio')
  const setUrlToPlay = (event) => {
    audioTag.src = event.target.dataset.url
    audioTag.play()
  }
  radioElementList.forEach((el) => {
    el.addEventListener('click', setUrlToPlay)
  })
})
