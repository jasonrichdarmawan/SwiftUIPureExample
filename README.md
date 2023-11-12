# Motivation

I want to check whether SwiftUI's navigation and view works well.

    Works well definition:
    - [x] No memory leak.
    
        But there will be unnecessary initialization.
    
        How to reproduce:
        1. HomePage -> navigate to App1FirstPage
        2. App1FirstPage -> navigate to 2
        3. App1SecondPage -> navigate to 3
        4. App2FirstPage -> change the counter's value
        
        It will initialize App1SecondPage and App1SecondViewModel everytime I change the counter's value.
        
    - [ ] No coupling betweeen views.

My previous motivation: I was designing an architectural pattern using the UIKit's navigation and SwiftUI's view.

The architectural pattern benefits are:
1. I am able to navigate from App1FirstPage to App2FirstPage without coupling between views.

    Coupling between views
    ```
    struct App1FirstPage: View {
        var body: some View {
            VStack {
                NavigationLink {
                    App2FirstPage()
                } label: {
                    Text("Go to App2FirstPage")
                }
            }
        }
    }
    ```
    
2. I am able to lazy load view.

    Lazy load view
    ```
    struct App1FirstPage: View {
        var body: some View {
            VStack {
                Button {
                    router.route(to: App2Route.FirstPage, as: PushTransition())
                } label: {
                    Text("Go to App2FirstPage")
                }
            }
        }
    }
    ```

    This repository use NavigationLazyView to lazy load view. So this benefit is debatable.
    
    PS: the code above is a pseudocode.

However, that architectural pattern have drawbacks:
1. I was unable to navigate in the preview.

    The solution: treat preview as a preview and not an actual app.
    
2. The top or bottom navigation bar in preview and in simulator is different.

    The solution: use custom top and bottom navigation bar.
    
    This solution is also used (`HomePage` use `HomeFooterComponent` instead of using the `.tabItem(_:)` method) in this repository because we was unable to modify the SwiftUI top or bottom navigation's padding.

# To Do

- [ ] reference SwiftModule to this repository.
