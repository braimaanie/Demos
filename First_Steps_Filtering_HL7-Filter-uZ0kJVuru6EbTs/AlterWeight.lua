function AlterWeight (OBX)
   for i=1, #OBX do 
      trace(Orig.OBX[i][5]:S())
      if OBX[i][3][1]:nodeValue() == 'WT' and OBX[i][6]:S() == 'pounds'then
         OBX[i][5][1][1]:setNodeValue(tonumber(OBX[i][5]:S()) * 0.454)
         OBX[i][6][1] = 'Kg'
      end
   end
   return OBX
end
