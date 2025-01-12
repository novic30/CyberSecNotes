[[Python 101]]
Data type is automatically found out in python. However, casting can be done to ensure tha the variable is of a certain data type.![Alt text](../Images/Pasted%20image%2020240707084759.png)

To assign a value:
```
name = "neut"
```
The value above is a string one

To assign number, do:
```
name_length = 4
```

Many variables can be written at once:
```
name, name_length = "neut" , 4
```

To test the data type: do
```
print(type(name)) #answer-will-be-str
```

Python can do casting which allows us to force the string, int etc. to be a certain data type.

Eg.
name_length = "4" # this is a string
name_length = int("4")

We can also make a list:
name_list = [ "neut" , "4orty" ]
```
print(type(name_list)) #the answer will be list
```
also,
we can do this:
name_list = name1, name2
print(name1)
print(name2)

Output:
neut
4orty

name_tuple = ("neut" , "4orty")
type will be given as tuple

name_dictionary = ("neut": 4 , "4orty": 6)
type will be given as dict

Other examples:

![Alt text](../Images/Pasted%20image%2020240707084802.png)
Results of the various data type values:x
![Alt text](../Images/Screenshot%202024-07-07%20at%2008.48.38.png)