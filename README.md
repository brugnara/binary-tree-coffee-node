binary-tree-coffee-node
=======================

**Usage**

First of all, we need a require:

```coffee
{BinaryTree} = require './binaryTree'

# example element
data = {
  username: "pippo"
  id: 223
}
```

After that, we can use the binaryTree this way:
```coffee
binaryTree = new BinaryTree "username", false 
```
- *arg[0]* = field to use for cheching position
- *arg[1]* = caseSensitive search

```coffee
binaryTree.insert data
```

**Output tree**

```coffee
console.log binaryTree.getAsArray()
```
