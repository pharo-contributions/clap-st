# ClapCommandLineHandler

ClapCommandLineHandler is something like an handler (thing which handles) for the Clap-st in Pharo. Currently Clap-st is still in development. To brief about Clap-st it is an Command Line Argument Parser for Pharo. Read more about it [here](https://github.com/cdlm/clap-st/). 

# How to load this code
  - Install [Iceberg](https://github.com/pharo-vcs/iceberg) in your Pharo Image. Iceberg is default from 6.0
  - Configure your iceberg and make sure it is working.
  - To use this handler, the clap-st package should be loaded first.
  - Using Iceberg clone the [clap-st](https://github.com/cdlm/clap-st/) repo and load the three packges in clap-st.
  - Then again using Iceberg clone this repo. 
  - Add both the source package and tests package.
  - You should now have it loaded in your image.

# How to install the package
 - Before using the handler, it has to be activated and installed first.
 - There are two options to do this for now
    -   Register ClapCommandLineHandler to the SessionManager and unregister the BasicCommandLineHandler. Because the mail goal of clap is to replace BasicCommandLineHandler.
         - To do this do 
         ```sh 
         ClapCommandLineHandler new register
          ```
          in playground.
    -   Or to just register ClapCommandLineHandler.
        - Do
        ```sh
        ClapCommandLineHandler new registerOnly
        ```
        Hopefully this method will be deprecated.
# Using ClapCommandLineHandler
Using ClapCommandLineHandler is simple. But to do this you should have the knowledge of clap-st. To breif about how to use this
- First, create a subclass to the current ClapCommandLineHandler.
- In the class side of your current class create a method named **command** and create an Clap command you need in this method and return the command created.
- And on the instance side add an method called **handleActivate: aMatch** which takes a match. You can put your own implementation here.
- To run the handler, from command line, 
```
CommandName arg1 arg2
```
- arg1 and arg2 can be either flags or positionals or subcommands or commands.
- So to breif the working, whenever you give an input on the commandline, the inputs command name is first taken and searches for an existing command.If there is a match with the command name, the handler takes all the arguments and converts them into ClapContext and matches them with the matched clap command. Then the match returned will be sent to the activate method of the command, which will look into how to use the match.
- Hence the implementation in the handleActivate:aMatch should decide what to return for a succcssfull match or handle an error.
    
Feel free to experiment this out and give your feedback.
