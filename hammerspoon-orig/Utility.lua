local Utility = {}

Utility.mash = {"ctrl", "alt", "cmd"}

function Utility.isEmpty(variable)
  return variable == nil or variable == ''
end

return Utility
