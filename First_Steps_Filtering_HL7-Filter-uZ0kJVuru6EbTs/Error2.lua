
function ERR (Error)
    if Error.important == false then 
      Error.description = 'Minor Error, '..Error.description
      iguana.logInfo(Error.description)
         elseif Error.important == true then
         Error.description = 'Important Error, '..Error.description
         iguana.logInfo(Error.description)
      end
   return Error
end