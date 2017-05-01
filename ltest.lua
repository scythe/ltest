
local checker = {}

function checker:assert_equal(actual, expected)
	if actual == expected then
		return
	end
	self.failed = true
	print(("[FAIL] ") .. self.testname)
	print("Expected: " .. expected)
	print("Received: " .. actual)
end

function checker:assert_type(actual, typeof)
	if type(actual) == typeof then
		return
	end
	self.failed = true
	print("[FAIL] " .. self.testname)
	print("Expected value of type " .. typeof)
	print("Received: " .. actual)
end

function checker:run_tests(suitename, suite)
	nfailing = 0
	for name, val in pairs(suite) do
		if type(name) == "string" and type(val) == "function" and name:match("^test_") then
			checker.testname = name
			checker.failed = false
			ok, msg = pcall(val, checker)
			if not ok then
				nfailing = nfailing + 1
				print("[ERROR] " .. checker.testname)
				print("Test crashed while running!")
				if msg then
					print("Recieved: " .. msg)
				end
			elseif checker.failed then
				nfailing = nfailing + 1
			end
		end
	end
	if nfailing > 0 then
		print(nfailing .. " tests failed in " .. suitename)
	else
		print("All " .. suitename .. " tests passed!")
	end
end

function checker:run_global(suitename)
	return checker:run_tests(suitename, _G)
end

return checker
