DTBlockAlertView
================

UIAlertView with block

##Installation##
Drag the <code>DTBlockAlertView</code> folder into your project.

##Usage##
Import the header file and declare your controlle.

	#import "DTBlockAlertView.h"
	
Like initial UIAlertView code
``` objective-c
DTBlockAlertView *alertView = [[DTBlockAlertView alloc] initWithUseBlock:block title:@"Title" message:@"Message" cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
```

And you can call class method
``` objective-c
DTBlockAlertView *alertView = [DTBlockAlertView alertViewUseBlock:block title:@"Demo" message:@"This an alert !" cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
```

Declare block
``` objective-c
DTAlertViewButtonClickedBlock block = ^(DTBlockAlertView *alertView, NSUInteger buttonIndex, NSUInteger cancelButtonIndex){
	Code in block
};
```

Show alert and UIAlertView are the same
``` objective-c
[alertView show];
```

##Install Code Snippet##
Copy `DTBlockAlertView.codesnippet` under `Code Snippet` folder to `~/Library/Developer/Xcode/UserData/CodeSnippets/` <br/>
* If your Xcode is opened, please quit Xcode and reopen Xcode

You can find code snippet at there

![Code Snippet](https://raw.github.com/Darktt/DTBlockAlertView/master/Raw/Image/CodeSnippet.png)

Or use key word `DTAlertViewButtonClickedBlock`

![Key Word](https://raw.github.com/Darktt/DTBlockAlertView/master/Raw/Image/KeyWord.png)

##License##
Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at

>[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)
 
Unless required by applicable law or agreed to in writing,  
software distributed under the License is distributed on an  
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,  
either express or implied.   
See the License for the specific language governing permissions  
and limitations under the License.