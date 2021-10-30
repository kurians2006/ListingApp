# Listing APP
Listing  Application


## Architecture Of The app:

**I am following the MVVM-P pattern where we have**

Model -> that holds data (in this case from network operations)
View / View Controller -> that's the canvas and the binder for all elements
View model -> that hold business logic including control on network connections and   Model

Reason For going with this approach: The application can be made easier to maintain in the long go especially when UI changes happen Business Logics can be kept hidden from UI changes thanks to the presentation layer. VC can be kept to control the Views rather than making Business logic as the View model does it.

We have a Network Manager, using URL sessions. This is kept separate for reusability accounts
A image downloader Extenstion with NSCache is added to speed up view
