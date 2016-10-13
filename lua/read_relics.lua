local http = require 'socket.http'
local res, code, headers, status = 
	http.request 'http://warframe.wikia.com/wiki/Void_Relic/ByRewards/SimpleTable'
print("Read wiki page")

-- Strip to only table
local start = string.find(res, "<table")
local finish = string.find(res, "</table")-1
local sub = string.sub(res, start, finish)
--Cut Table and Table Header
sub = string.sub(sub, string.find(sub, "<td>"), string.len(sub))
--Strip out misc. html table markups
sub = string.gsub(sub, "<td>", "")
sub = string.gsub(sub, "</td>", "")
sub = string.gsub(sub, "<tr>", "")
sub = string.gsub(sub, "</tr>", "")
-- &nbsp
sub = string.gsub(sub, "&#160;", "")
-- empty lines
sub = string.gsub(sub, "(\r?\n)%s*\r?\n", "%1")
-- make prime shorter
sub = string.gsub(sub, "PRIME", "P.")
--Start converting to .js
-- commas & quotes
sub = string.gsub(sub, '\r\n?', '\n')
sub = string.gsub(sub, "BLUEPRINT\n", "BP\",")
sub = string.gsub(sub, "BARREL\n", "BARREL\",")
sub = string.gsub(sub, "RECEIVER\n", "RECIEVER\",")
sub = string.gsub(sub, "STOCK\n", "STOCK\",")
sub = string.gsub(sub, "CARAPACE\n", "CARAPACE\",")
sub = string.gsub(sub, "CEREBRUM\n", "CEREBRUM\",")
sub = string.gsub(sub, "SYSTEMS\n", "SYSTEMS\",")
sub = string.gsub(sub, "LINK\n", "LINK\",")
sub = string.gsub(sub, "BLADE\n", "BLADE\",")
sub = string.gsub(sub, "HANDLE\n", "HANDLE\",")
sub = string.gsub(sub, "HEAD\n", "HEAD\",")
sub = string.gsub(sub, "STARS\n", "STARS\",")
sub = string.gsub(sub, "POUCH\n", "POUCH\",")
sub = string.gsub(sub, "BUCKLE\n", "BUCKLE\",")
sub = string.gsub(sub, "HILT\n", "HILT\",")
sub = string.gsub(sub, "HARNESS\n", "HARNESS\",")
sub = string.gsub(sub, "WINGS\n", "WINGS\",")
sub = string.gsub(sub, "BAND\n", "BAND\",")
sub = string.gsub(sub, "GRIP\n", "GRIP\",")
sub = string.gsub(sub, "LIMB\n", "LIMB\",")
sub = string.gsub(sub, "STRING\n", "STRING\",")
sub = string.gsub(sub, "CHASSIS\n", "CHASSIS\",")
sub = string.gsub(sub, "NEUROPTICS\n", "NEUROPTICS\",")
sub = string.gsub(sub, "LITH\n", "relicEnum.LITH,\"")
sub = string.gsub(sub, "AXI\n", "relicEnum.AXI,\"")
sub = string.gsub(sub, "MESO\n", "relicEnum.MESO,\"")
sub = string.gsub(sub, "NEO\n", "relicEnum.NEO,\"")
sub = string.gsub(sub, "\nCommon", "\",Common")
sub = string.gsub(sub, "\nUncommon", "\",Uncommon")
sub = string.gsub(sub, "\nRare", "\",Rare")
local preamble = "\tprimePartDB.push(new PrimePart(\""
sub = string.gsub(sub, "\n", "\n"..preamble)
sub = string.sub(sub, 0, -1*(string.len(preamble)+2))
sub = preamble..sub


--Convert Common/Uncommon/Rare to Ducat Values
sub = string.gsub(sub, "Common", "15));")
sub = string.gsub(sub, "Uncommon", "45));")
sub = string.gsub(sub, "Rare", "100));")

--Add header
header = "var primePartDB = new Array;\n" 
header = header.."var timeGen = "..os.date("\"%m/%d/%y at %H:%M\"")..";\r\n"
header = header.."function createPrimePartDatabase() {\n"
footer = "\n}";
sub = header .. sub .. footer

--Finalize File
print("Write file")
local file = io.open("js/relics_db.js", "w")
file:write(sub)
file:flush();
file:close()
print("js/relics_db.js written")