# SecureDoor

iOS mobile application for opening and managing secure doors.
* VIPER architecture
* Firebase authentication - Login
* CoreData - Local Storage


## Getting Started

This project is built in Xcode. Library management using [CocoaPods](https://guides.cocoapods.org/using/getting-started.html#getting-started)

### Prerequisites

After pulling the project from git, open the terminal in 'Secure Door' folder and run command

```
pod install
```

### Opening project

Double click 'Secure Door.xcworkspace' 

### Signing

Automatically manage signing

## Screens
### Login
Login Screen - Enter provided emails and passwords to login

![login](https://user-images.githubusercontent.com/4028036/52368335-70cfe800-2a4e-11e9-9290-55496af55a73.png)

### Doors

All available doors.

After door click, popup is shown with the status: SUCCESS / DENIED

Admin account is always allowed to open any door.

Admin can add new doors.

![doors](https://user-images.githubusercontent.com/4028036/52368333-70cfe800-2a4e-11e9-8f37-c51679d1896a.png)

### Events

User can see only his own events, admin user can see all events for all users, admin events (opening doors) are not recorded.

![events](https://user-images.githubusercontent.com/4028036/52368334-70cfe800-2a4e-11e9-9b5b-e01781357694.png)

### Users

This screen is available only for admin user. Managing user permissions for doors.

![users](https://user-images.githubusercontent.com/4028036/52368337-71687e80-2a4e-11e9-9b40-dc0c004ead36.png)

### Menu

![menu](https://user-images.githubusercontent.com/4028036/52368336-70cfe800-2a4e-11e9-9a68-1ff17dc21eda.png)



## [Youtube Video](https://youtu.be/1XbUaRdY4jQ) 



## Libraries
[Firebase](https://github.com/firebase/firebase-ios-sdk) - Authentication
* Firebase/Core
* Firebase/Auth

[Swinject](https://github.com/Swinject/Swinject) - DI
* Swinject
* SwinjectStoryboard

[SWRevealViewController](https://github.com/John-Lluch/SWRevealViewController) - Menu
* SWRevealViewController

[ProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD) - Progress display/Loading
* SVProgressHUD

[Toasts](https://github.com/scalessec/Toast-Swift)
* Toast-Swift



## Possible Updates

* Localisation
* Registration / Adding new users
* Different API for authentication and admin management
* Unit Tests
* Deleting door
* Rename door


## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/jakovvidekovic/SecureDoor/blob/master/LICENSE) file for details

