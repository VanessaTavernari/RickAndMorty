# RickAndMorty
This project users can meet some information about cartoon character.

They look at a picture with character name, then just need to click and it will open a new view with information about character who was selected. If the user need to more information, there is a *+info* button.

In this project I worked with *rickandmortyapi*, so I done a struct with the same information from api. There is a function with a parameter to pass url.

JsonDecoder() was used to decodes instances of a data type from JSON objects, I used too DispatchQueue to return tableView.reloadData(), this it will reloads the rows and sections of the table view.

My class ViewController is a type UITableViewController, so I just configured numberOfRowsInSection, cellForRowAt and didSelectRowAt.

In cellForRowAt I returned a function that I created using new file cocoa touch class, in this file there are UIImageView() and UILabel() to draw the view which to appear when open the application.

In didSelectRowAt was the same as the previous one, plus to add UIButton() and for this I need to create a new file to appear the new view when the button is click.

Some times I used DispatchQueue that manages the execution of tasks serially or concurrently on my app main thread or on a background thread.

**Learning about: UITableViewController, UIButton, UIImageView, UILabel, DispatchQueue and Api.**


## How to run
Clone this repository and open using XCode.

---
*This project was developed during the study.*
