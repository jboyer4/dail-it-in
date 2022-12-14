Readme

Summary:

Does it accomplish the stated objective? (10 points)
    Objective: Provide a way for coffee enthusiasts to save their favorite espresso measurements and access them later.
    
    Does it deliver on the “value proposition”? (10 points)
        Provide a minimalistic approach that is concise and 
        displays the information clearly when users try to remake old recipies
        
    Does it respect user privacy/is it secure? (10 points)
        Minimal data is stored and the data that is stored contains no ppi
        
    Does it have proper app lifecycle/state management? (10 points)
        Uses swift UI model @Binding and @State tags to manage state between views. Additionally Leverages two different methods for deep storage. @SceneStorage stores primitives in a relational db to recover from interuptions.  Recipies are serialized/deserialized according to Apple developer standards and saved as JSON.
        
    Does it address at least three additional challenges (other than privacy and state management) unique to mobile app development? (15 points)
1) Photo library access. I allow a user to access a photo from their phone photo library to use for a recipie (add it from the saved details page)
2)Share your recipies - This feature came from user interviews. 2/3
    said this was their most important feature (unprompted) so I 
    pivoted to make it happen.  Sends the recipie as formatted text in a message.    
3) Accessibility. I wanted to look at how accessiblility works in native iOS apps because a large focus of one of my work projects 
revolves around accessibility. I referenced Apple's accesibility label documentation and standards here https://developer.apple.com/documentation/swiftui/view/accessibilitylabel(_:)-1d7jv 
Basically Text() can be read to users by voiceover (https://www.apple.com/accessibility/iphone/index.html) , as can the componant type but in accordance with their standards I provided Text()labes to 
Buttons so that the action can be read to users.  Additionally, I used high contrast colors to meet protoanomaly and tritonamaly color blind color standards https://webaim.org/articles/visual/
4) Orientation & HW - I ended up rewritting my app from storyboards to swiftUI because the layout was not coforming to different hardware (iphone se vs 12 pro for example) and completely breaking on rotate.  Given the mobile context, it felt really important to me to make this work despite the big lift to rewrite the project over. 

    
Does it have a good user experience? (5 points)
    I like the clean look with simple colors. I provide helpful hints and text prompts for entry fields. The recipie list is easy to scroll through and provides enough info without being overwhelming. Detail view has a clean layout.

Thanks! I learned a lot! I was pretty proud of accessing a swiftUI component from a storyboard and mixing the workflows successfully. Even though it didn't end up in the final project, it was a big learning experience.

Justin Boyer Dec 13, 2022
