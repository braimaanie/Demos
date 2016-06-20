
local helpers = {}

--
-- Read in the whole file, close it and return its contents.
--
helpers.readAll = function(Path)
   local File = io.open(Path)
   local Data = File:read("*a")
   File:close()
   return Data
end

--
-- Generate a nonce. See https://en.wikipedia.org/wiki/Cryptographic_nonce.
-- 
helpers.makeNonce = function(InputData)
   return filter.hex.enc(crypto.digest{data=tostring(InputData), algorithm='sha1'})
end

--
-- The following steps are specified by the OAauth RFC for building
-- the parameter string to be used in the signature base.
-- See https://tools.ietf.org/html/rfc5849#section-3.4.1.3.2
--
helpers.makeOAuthParamStr = function(Table)
   -- 1. URI encode the keys and values.
   EncodedTable = {}
   for k,v in pairs(Table) do
      EncodedTable[helpers.percentEncode(k)] = helpers.percentEncode(tostring(v))
   end

   -- 2. Sort alphabetically by key. In Lua this requires building an
   --    array using the keys, sorting it, then using that array to 
   --    index the table.
   local SortedKeys = {}
   for Key in pairs(Table) do
      table.insert(SortedKeys, Key)
   end

   table.sort(SortedKeys)

   -- 3. Build the string into a standard GET query string.
   local Out = ""
   for i in ipairs(SortedKeys) do
      Out = Out .. SortedKeys[i] .. "=" .. EncodedTable[SortedKeys[i]] .. "&"
   end

   -- Remove the final ampersand.
   Out = Out:sub(1, -2)
   trace(Out)

   return Out
end

--
-- Using + instead of %20 is outdated and breaks OAuth. This ensures that
-- spaces are encoded as %20 and not +. The proper version is known as
-- percent encoding.
--
helpers.percentEncode = function(Data)
   local StrictResultData = filter.uri.enc(Data)
   StrictResultData = StrictResultData:gsub("+", "%%20")
   return StrictResultData
end

return helpers
