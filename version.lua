local version = { }
version.__index = version


function version.new(major, minor, patch)
  local self = { }
  setmetatable(self, version)

  self._major = major
  self._minor = minor
  self._patch = patch

  return self
end


function version:major()
  return self._major
end


function version:minor()
  return self._minor
end


function version:patch()
  return self._patch
end


function version:__tostring()
  return self._major..'.'..self._minor..'.'..self._patch
end


return version
