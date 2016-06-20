
function AlterPID(PID)
   PID[5][1][2] = PID[5][1][2]:nodeValue():upper()
   PID[5][1][1][1] = PID[5][1][1][1]:nodeValue():upper()
   local DOB = dateparse.parse(PID[7][1]:nodeValue())
   PID[7][1] = os.date('%Y%m%d', DOB)
   return PID
end
