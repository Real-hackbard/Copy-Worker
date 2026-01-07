# Copy-Worker:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)  ![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Description](https://github.com/user-attachments/assets/dbf330e0-633c-4b31-a0ef-b1edb9ed5aa7) ![Copy Worker](https://github.com/user-attachments/assets/72aa65b3-72ba-4ce1-8ae5-3c6a24cfc952)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) ![012026](https://github.com/user-attachments/assets/ae91e595-2dbf-4d94-b953-81e4fd25dcc3)   
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)  

</br>

File copying is the act of creating a new file such that it has the same content as an existing file. The operation is sometimes called cloning.

Generally, an operating system command-line [shell](https://en.wikipedia.org/wiki/Shell_(computing)) provides for file copying via commands cp, copy and similar variants. mv also copies files but only when the source and destination are on different file systems. Windows also provides includes the more advanced tools: [Robocopy](https://en.wikipedia.org/wiki/Robocopy) and [xcopy](https://en.wikipedia.org/wiki/XCOPY).

Many operating systems also provide for copying files via a graphical user interface, such as a file manager. It may provide for [copy-and-paste](https://en.wikipedia.org/wiki/Cut,_copy,_and_paste) and [drag-and-drop](https://en.wikipedia.org/wiki/Drag_and_drop) user experience.

</br>

![CopyFolder](https://github.com/user-attachments/assets/529a3e96-f9fd-4ada-a0c3-d04273725f90)

</br>

# Masks:
File masks can be a useful way to select a set of files meeting specific criteria. A mask is a string of characters with defined meanings. Character matches are not case sensitive, upper and lower case versions of a letter will match.

| Mask | Description |
| :-----------: | :----------- |
| ```* (asterisk)```     | a "wild card" indicating an unspecified number of characters in the file name.     |
| ```? (question mark)```     | a wild card which matches a single character position in the file name.     |
| ```[  (open bracket)```     |  beginning of a "set" definition, a set of alternative characters for specific position.     |
| ```] (close bracket)```     | the end of a set defininition     |
| ```!  (exclamation point)```     | may appear immediately following a [ to indicate that any character not in the set counts as a match.     |
| ```-  (hyphen)```     | separating two characters in a set indicates a range of character to test.

</br>

Here are some examples: (In these examples double quotes (") are used to identify literals but are not part of the string being referenced.)

# Examples:

| Example | Description |
| :-----------: | :----------- |
| ```*.*```     | match any string that has a dot (.) in any position     |
| Zelle 2,1     | Zelle 2,2     |
| Zelle 1,1     | Zelle 1,2     |
| Zelle 2,1     | Zelle 2,2     |
| Zelle 1,1     | Zelle 1,2     |
| Zelle 2,1     | Zelle 2,2     |







