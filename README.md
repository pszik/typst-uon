# Typst UoN 

Typst project template for use at the University of Nottingham.

The module exports the following values:

- `uon-project` is a top-level show rule that sets up the entire document;
- `uon-colour` is a dictionary of functions that provide approved UoN colours;
- `appendices` is a show rule that makes any sections appearing after it to be 
  styled as appendices; and 
- `task` is a function that displays a student task (e.g. in a lab sheet).

To create a UoN document begin with the following:

```typst 
#import "@local/typst-uon:0.2.0": *

#show: uon-project.with()
```

The configuration for `uon-project` is explained below. 


## UoN Project 

To set up a project, use the `uon-project` show rule as shown above. This automatically
does the following things:

- set the font to Fira Sans, the monospace font to Fira Mono, and the maths font to Fira Math;
- sets the default font size to 11;
- initialises the `booktabs` package for presenting tables; and 
- initialises the `codly` package for showing code fragments.

The project can be configured with the following options:

- `title`: the string title of the document (default empty),
- `authors`: an array of author names (default empty),
- `num-columns`: the number of columns the document should use (default 1), and
- `accent-colour`: the colour to use to emphasise level one and two headings and other 
  important elements (default to Jubilee Red 100%).

## UoN Colours 

UoN has a set of official colours.[^1] The `uon-colour` function is a dictionary 
of functions that provide these colours in Typst. The keys are as follows:

- `uon-colour.blue` is Nottingham Blue,
- `uon-colour.red` is Jubilee Red,
- `uon-colour.orange` is Mandarin Orange,
- `uon-colour.green` is Forest Green,
- `uon-colour.sky-blue` is Malaysia Sky Blue, and 
- `uon-colour.stone` is Portland Stone.

Each of these is a function which takes a tint as a percentage. If a given tint 
does not exist for the chosen colour, the 100% tint will be returned. Here are 
some examples:

```
#let primary = (uon-colour.red)()
#let secondary = (uon-colour.sky-blue)(tint: 60%)
```
[^1]: https://www.nottingham.ac.uk/brand/visual/colour.aspx
