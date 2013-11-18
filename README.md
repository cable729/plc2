## Note
This project is incomplete. I could never get unit testing to work. I may start a new project in Haskell now that I've learned the basics. For that project I would explore architecture and module design which I was unable to do in this assignment (just implementation of functions which were arguably not designed the greatest).

Project 2 for Programming Language Concepts (CSCE322 at UNL)
As you can see from the language statistics bar, Haskell is green as in good to go.

##Installation Instructions
1. Download Haskell: [Windows](http://www.haskell.org/platform/windows) | [Mac](http://www.haskell.org/platform/mac)
2. Configure with your favorite IDE. Instructions for Sublime Text follow.

###Sublime-Text
1. Install the `SublimeHaskell` package (With Package Manager installed: ctrl+shift+p, "install package", "SublimeHaskell").
2. Run the following command:

    ```Batchfile
    cabal update && cabal install aeson haskell-src-exts haddock test-framework test-framework-hunit
    cabal configure --enable-tests
    ```

3. Restart Sublime Text, you should be good to go. If Sublime isn't starting, go to taskmanager and close it then run the previous command.

##Resources Used
- [Haskell official language guideline](shttp://www.haskell.org/haskellwiki/Programming_guidelines)
- [Haskell official project setup guidelines](http://www.haskell.org/haskellwiki/How_to_write_a_Haskell_program)
- [Directory structure](http://www.haskell.org/haskellwiki/Structure_of_a_Haskell_project#Directory_Structure)
- [Haskell plugin for ST2](https://github.com/SublimeHaskell/SublimeHaskell)
