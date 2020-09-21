# EmojiFlipApp
## Overview

EmojiFlipApp is a simple memory-training card flip game that asks the player to find two matched cards. This is an opening overview for the README.md. The game is written in Swift/SwiftUI with XCode by adopting the Model-View-ViewModel structure, and uses several protocols such as Animatable and View. I also implemented a protocol, a viewModifer, a Shape, and an Animation for the app. These will be introduced later in this file.

<img src="Demo.gif" width="200">

## Model-View-ViewModel
The game is written by adapting the Model-View-ViewModel structure. I created three files: "View.swift", "Model.swift", and "ViewModel.swift", each representing one of the critical components of this app.

The View module contains two structs: ContentView and CardView. Both structs conform to the View protocol. As their names may suggest, the ContentView corresponds to the overall view of the app, in which it utilizes the CardView struct. Each CardView struct created by ContentView represents the view of a card. The ContentView struct also contains an @ObservedObject, which is the ViewModel struct.

The ViewModel module contains one class, which is the viewModel class. It is in charge of communciating between the Model and the View. The viewModel contains a @Published private struct, which is a Model struct.

The Model Struct records all the data/states of the game. It records all cards in an array of Card, which is a struct that simply represents a card. Each Card struct within the Model contains a timer that times for bonus marks. If a player finds a match in time with remaining bonus time, the player will get a bonus mark.

Upon a user click, the ContView struct will call the intention function in its ViewModel, which then calls the intention function "Choose" in the Model struct. The Model reacts to the function by checking whether there's a match or not, and translating the intention into a state.

## View

### Grid
SwiftUI does not come with a grid-ish View. Therefore, I wrote a grid View in the Grid.swift and GridLayout.swift. The Grid struct is essentially a template struct that requires an Item and an ItemView (in this game, they will certainly be a Card and a Cardview) which can be reused in future apps that needs a grid. The Grid struct contains an array of Item, and its body View calculates the position and dimensions of each Item according to the amount of space it is given as well as the length of the array of Item.

### Cardify
Cardify is an AnimatableModifier (ViewModifier + Animatable) in Cardify.swift. It takes a content (in this game, an Emoji text) and "card-ifies" it by placing it on one side of a rectangle, and adding a cardback for the view. It consumes a Boolean value - isFaceUp, which flips the card accordingly.

The Cardify viewModifier also contains an animation, which creates the "card flip" effect as shown in the demo gif.

## Design
