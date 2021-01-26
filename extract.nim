import xmlparser, xmltree, base64, strtabs, os

if commandLineParams().len < 1:
  quit("usage: extract <filename>", -1)

var filename = commandLineParams()[0]
if not fileExists(filename):
  quit("could not find file: " & filename, -1)

var x:XmlNode = filename.loadXml()
if x.isNil:
  quit("could not find file: " & filename, -1)

var i:XmlNode = x.child("ImageList").child("Image")
if i.isNil:
  quit("could not find image data", -1)

var a:XmlAttributes = i.attrs
var img_data = i.innerText
var img_name = if a.hasKey("name"): a["name"].addFileExt("png") else: "stamp.png"
if img_data.len == 0:
  quit("error extracting the image data.", -1)

# write the image data to a file
writeFile(img_name, decode(img_data))
echo "file written."