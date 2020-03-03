# ResourciOS
Generates Structs or Classes with localizable text and image assets.

# Instalation
 1. Download the "Resourcing" executable
 2. Open the terminal and execute "Resourcing" as follows:
    `./Resourcing` It searches in the current directory and generate struct with static attributes.
    `./Resourcing attributesStruct` It searches in the current directory and generate struct with static attributes.
    `./Resourcing attributesClass` It searches in the current directory and generate singleton class with attributes.
    `./Resourcing methods` It searches in the current directory and generate singleton class with static methods.
    `./Resourcing <path>` attributesStruct\t It searches in the path and generate struct with static attributes.
    `./Resourcing <path> methods` It searches in the path and generate struct with static attributes.
    `./Resourcing <path> attributesClass` It searches in the path and generate singleton class with static attributes.
    
 3. The program finds .string files and assets and generates class or struct.
 4. Reference the files to xcode


# One more thing
You can execute ResourciOS directly in XCode. This can be add new run script phases and write the command as the terminal. 
You can also place the executable at the root of the project.

