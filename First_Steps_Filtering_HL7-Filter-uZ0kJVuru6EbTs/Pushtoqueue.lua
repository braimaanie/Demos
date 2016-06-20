function PushQueue (Out) 
   local DataOut = tostring(Out)
   queue.push{data=DataOut}
end