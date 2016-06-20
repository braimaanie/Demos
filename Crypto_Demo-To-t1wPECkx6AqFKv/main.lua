	
local h = require "crypto-helpers" 

local OtherFiles         = iguana.project.files()
local DataToSign         = OtherFiles["other/data.txt"]
local RSAPrivateKeyPath  = OtherFiles["other/private.pem"]
local RSAPublicKeyPath   = OtherFiles["other/public.pem"]
local DSAPrivateKeyPath  = OtherFiles["other/private-dsa.pem"]
local DSAPublicKeyPath   = OtherFiles["other/public-dsa.pem"]
local WrongPublicKeyPath = OtherFiles["other/wrong-public.pem"]
local HashingAlgorithm   = "sha1"

function main()

   iconv.list()
   iconv.supported('UTF8')
   
   demoSigning(DataToSign, DSAPrivateKeyPath, DSAPublicKeyPath)
	
   
   crypto.algorithms()
end

function demoSigning(DataToSign, PrivateKeyPath, PublicKeyPath)
   local Data = h.readAll(DataToSign)
   local PrivateKey = h.readAll(PrivateKeyPath)
   
   local Signature = crypto.sign{key=PrivateKey, data=Data, algorithm=HashingAlgorithm}


   local PublicKey = h.readAll(PublicKeyPath)
   
   local Result = crypto.verify{
      data      = Data,
      key       = PublicKey,
      signature = Signature,
      algorithm = HashingAlgorithm
   }

   local AlteredData = "malicious" .. Data
   local Result = crypto.verify{    --
      data      = AlteredData,      -- Altering the data causes verify to fail.
      key       = PublicKey,        --
      signature = Signature,        --
      algorithm = HashingAlgorithm  --
   }

   local AlteredSignature = "malicious" .. Signature
   local Result = crypto.verify{    --
      data      = Data,             --
      key       = PublicKey,        --
      signature = AlteredSignature, -- Altering the signature causes verify to fail.
      algorithm = HashingAlgorithm  --
   }

   local WrongPublicKey = h.readAll(WrongPublicKeyPath)
   local Result = crypto.verify{    --
      data      = Data,             --
      key       = WrongPublicKey,   -- The wrong public key causes verify to fail.
      signature = Signature,        --
      algorithm = HashingAlgorithm  --
   }
end
