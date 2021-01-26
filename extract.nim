import xmlparser, xmltree, base64, strtabs, os

if commandLineParams().len < 1:
  quit("usage: extract <filename>", -1)

var filename = commandLineParams()[0]
if not fileExists(filename):
  quit("could not find file: " & filename, -1)

var x:XmlNode = filename.loadXml()
var i:XmlNode = x.child("ImageList").child("Image")
var a:XmlAttributes = i.attrs
var img_data = i.innerText
var img_name = a["name"]

if img_data.len == 0:
  quit("error extracting the image data.", -1)

# write the image data to a file
var img_filename = if img_name isnot "": img_name.addFileExt("png") else: "stamp.png"
writeFile(img_filename, decode(img_data))
echo "file written."