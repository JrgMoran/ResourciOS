# ResourciOS
Generates Structs or Classes with localizable text and image assets.

# Instalation
 1. Download the "ResourciOS" executable
 2. Open the terminal and execute "ResourciOS" as follows:
    -`./ResourciOS` It searches in the current directory and generate struct with static attributes.
   - `./ResourciOS attributesStruct` It searches in the current directory and generate struct with static attributes.
   - `./ResourciOS attributesClass` It searches in the current directory and generate singleton class with attributes.
   - `./ResourciOS methods` It searches in the current directory and generate singleton class with static methods.
    -`./ResourciOS <path>` attributesStruct\t It searches in the path and generate struct with static attributes.
    -`./ResourciOS <path> methods` It searches in the path and generate struct with static attributes.
   - `./ResourciOS <path> attributesClass` It searches in the path and generate singleton class with static attributes.
    
 3. The program finds .string files and assets and generates class or struct.
 4. Reference the files to xcode


# One more thing
You can execute ResourciOS directly in XCode. This can be add new run script phases and write the command as the terminal. 
You can also place the executable at the root of the project.

