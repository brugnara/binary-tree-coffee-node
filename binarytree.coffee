###
  Daniele Brugnara
  2013 - praim.com
###


class Leaf

  constructor: (@data) ->
    #console.log "Created a new leaf!"

  getData: =>
    @data

  setRightLeaf: (@right) ->

  setLeftLeaf: (@left) ->

  getRightLeaf: ->
    @right

  getLeftLeaf: ->
    @left

class @BinaryTree
  orderField: ''
  root: null
  #
  constructor: (@orderField, @caseSensitive) ->

  insertLoop: (currLeaf, el) ->
    #console.log "Parsing caseSensitive (#{!@caseSensitive}), is el (=#{el[@orderField]}) < than data (=#{currLeaf.getData()[@orderField]})? #{el[@orderField] < currLeaf.getData()[@orderField]}"
    cmpValue1 = el[@orderField]
    cmpValue2 = currLeaf.getData()[@orderField]
    if (@caseSensitive)
      cmpValue1 = cmpValue1.toLocaleLowerCase()
      cmpValue2 = cmpValue2.toLocaleLowerCase()
    #
    if el[@orderField] < currLeaf.getData()[@orderField]
      return @insertLoop currLeaf.getLeftLeaf(), el if currLeaf.getLeftLeaf()
      currLeaf.setLeftLeaf(new Leaf el)
    else
      return @insertLoop currLeaf.getRightLeaf(), el if currLeaf.getRightLeaf()
      currLeaf.setRightLeaf(new Leaf el)

  readLoop: (currLeaf, retAr) ->
    @readLoop currLeaf.getLeftLeaf(), retAr if currLeaf.getLeftLeaf()
    retAr.push currLeaf.getData()
    @readLoop currLeaf.getRightLeaf(), retAr if currLeaf.getRightLeaf()

  insert: (element) ->
    if not @root
      @root = new Leaf element
    else
      @insertLoop @root, element

  getAsArray: ->
    retArray = []
    # start looping
    @readLoop @root, retArray
    retArray

