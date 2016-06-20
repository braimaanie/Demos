require'dateparse'
require'hl7util'
require'ErrorLoop'
require'AlterMsgs'
--This is a demo script
function main(Data)
   local Orig, Name, Error = hl7.parse{vmd='demo.vmd', data=Data}
   local Out = hl7.message{vmd='demo.vmd', name=Orig:nodeName()}
   Out:mapTree(Orig)

   local PID = hl7util.findSegment(Orig, FindPID)
   local OBX = hl7util.findSegment(Orig, FindOBX)
   AlterMSH(Out.MSH)
   --Checking if PID segment exists, if yes, it Alters the PID segment
   if PID then
      AlterPID(Out.PID)
   end   
   --Checking if OBX segment exists, if yes, it Alters OBX segment
   if OBX then
      AlterWeight(Out.OBX)
   end
   --Checks for errors in the message and sends a message to the logs
   Er(Error)
   trace(Out)

   local DataOut = tostring(Out)
   queue.push{data=DataOut}

end

-- function to find (match) a PID segment
function FindOBX(Segment)
   if Segment:nodeName() == 'OBX' then
      return true
   end
end

-- function to find (match) a PID segment
function FindPID(Segment)
   if Segment:nodeName() == 'PID' then
      return true
   end
end

--[[check this link to finish the demo
http://learn.interfaceware.com/5227.html
]]