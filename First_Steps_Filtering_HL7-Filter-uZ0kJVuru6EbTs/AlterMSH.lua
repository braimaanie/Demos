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