# EmojiFlipApp
## Overview

EmojiFlipApp is a simple memory-training card flip game that asks the player to find two matched cards. This is an opening overview for the README.md. The game is written in Swift/SwiftUI with XCode by adopting the Model-View-ViewModel structure, and uses several protocols such as Animatable and View. I also implemented a protocol, a viewModifer, a Shape, and an Animation for the app. These will be introduced later in this file.

<img src="Demo.gif" width="200">

## Model-View-ViewModel
The game is written by adapting the Model-View-ViewModel structure. I created three files: "View.swift", "Model.swift", and "ViewModel.swift", each representing one of the critical components of this app.

The View module contains 
