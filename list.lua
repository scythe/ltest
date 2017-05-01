--example functions to be tested

list = {}

function ascending(a, ...)
	local function lesser(a, b) return a < b end
	return sorted(lesser, a, ...)
end
list.ascending = ascending

function descending(a, ...)
	local function greater(a, b) return a > b end
	return sorted(greater, a, ...)
end
list.descending = descending

function sorted(before, a, ...)
	if #{...} == 0 then
		return a
	end
	local function insert(a, b, ...)
		if b == nil then
			return a
		elseif before(b, a) then
			return b, insert(a, ...)
		else
			return a, b, ...
		end
	end
	return insert(a, sorted(before, ...))
end
list.sorted = sorted

function first(a, ...)
	return a
end
list.first = first

return list
