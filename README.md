# Exercise

Produce a Ruby 2+ program that simulates a basic interactive bitmap editor.
Bitmaps are represented as an M x N matrix of pixels with each element
representing a colour.

# Program input

The input consists of a file containing a sequence of commands, where
a command is represented by a single capital letter at the beginning of the line.
Parameters of the command are separated by white spaces and they follow the command character.

Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

# Commands

There are 6 supported commands:

* I M N - Create a new M x N image with all pixels coloured white (O).
* C - Clears the table, setting all pixels to white (O).
* L X Y C - Colours the pixel (X,Y) with colour C.
* V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* S - Show the contents of the current image

# Example

To run the application you must supply a command file like so `ruby runner.rb commands/template.txt`

In the example below, > represents each line of the command file


```
> I 5 6
> L 2 3 A
> S
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
> V 2 3 6 W
> H 3 5 2 Z
> S
OOOOO
OOZZZ
OWOOO
OWOOO
OWOOO
OWOOO
```

When implementing this program focus on quality and best practices. Make sure the program works with odd input and doesn't crash.

