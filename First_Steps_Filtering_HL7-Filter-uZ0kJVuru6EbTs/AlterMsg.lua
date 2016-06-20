function AlterMSH(MSH)
   MSH[3][1] = 'MyApp'
   MSH[4][1] = 'MyOffice'
   if MSH[9][1]:nodeValue() == 'ADT' then 
      MSH[9][1] = 'Admission Dishcharge Transfer'
      elseif MSH[9][1]:nodeValue() == 'Lab' then
      MSH[9][1] = 'Laboratory'
      else 
      MSH[9][1] = MSH[9][1]
   end 
   return MSH
end


function AlterPID(PID)
   PID[5][1][2] = PID[5][1][2]:nodeValue():upper()
   PID[5][1][1][1] = PID[5][1][1][1]:nodeValue():upper()
   local DOB = dateparse.parse(PID[7][1]:nodeValue())
   PID[7][1] = os.date('%Y%m%d', DOB)
   return PID
end

function AlterWeight (OBX)
   for i=1, #OBX do 
      trace(OBX[i][5]:S())
      if OBX[i][3][1]:nodeValue() == 'WT' and OBX[i][6]:S() == 'pounds'then
         OBX[i][5][1][1]:setNodeValue(tonumber(OBX[i][5]:S()) * 0.454)
         OBX[i][6][1] = 'Kg'
      end
   end
   return OBX
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