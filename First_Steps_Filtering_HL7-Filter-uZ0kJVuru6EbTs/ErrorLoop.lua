function Er (Error) 

if Error[1] ~=nil then   
for k,v in pairs(Error) do
	if Error[1].important == true then
      Error[1].description = 'Important Error, '..Error[1].description
      iguana.logInfo(Error[1].description)
         break
         else
         Error[1].description = 'Minor Error, '..Error[1].description
         iguana.logInfo(Error[1].description)
         break
      end
   end 
end   
   
if Error[2] ~=nil then   
   for k,v in pairs(Error) do   
   if Error[2].important == false then 
      Error[2].description = 'Minor Error, '..Error[2].description
      iguana.logInfo(Error[2].description)
         break
         else
         Error[2].description = 'Important Error, '..Error[2].description
         iguana.logInfo(Error[2].description)
         break
      end
   end
end      

if Error[3] ~=nil then   
   for k,v in pairs(Error) do
   if Error[3].important == false then 
      Error[3].description = 'Minor Error, '..Error[3].description   
      iguana.logInfo(Error[3].description)
         break
         else
         Error[3].description = 'Important Error, '..Error[3].description
         iguana.logInfo(Error[3].description)
         break
      end
   end   
end   

if Error[4] ~=nil then   
   for k,v in pairs(Error) do   
   if Error[4].important == false then
      Error[4].description = 'Minor Error, '..Error[4].description   
      iguana.logInfo(Error[4].description)
         break
         elseif Error[4].important == true then
         Error[4].description = 'Important Error, '..Error[4].description
         iguana.logInfo(Error[4].description)
         break
      end
	end

if Error[5] ~=nil then
   for k,v in pairs(Error) do   
      if Error[5].important == false then
      Error[5].description = 'Minor Error, '..Error[5].description   
      iguana.logInfo(Error[5].description)
         break
         elseif Error[5].important == true then
         Error[5].description = 'Important Error, '..Error[5].description
         iguana.logInfo(Error[5].description)
         break
      end
    end
end
   
if Error[6] ~=nil then   
    for k,v in pairs(Error) do  
      if Error[6].important == false then
      Error[6].description = 'Minor Error, '..Error[6].description   
      iguana.logInfo(Error[6].description)
         break
         elseif Error[6].important == true then
         Error[6].description = 'Important Error, '..Error[6].description
         iguana.logInfo(Error[6].description)
         break
      end
    end
end     
end      
   return Error
   end


