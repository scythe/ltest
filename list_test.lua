--example ltest unit test

checker = require "ltest"
list = require "list"

--functions beginning with "test_" will be run
function test_ascending(checker)
	a, b, c, d = list.ascending(55, 43, 67, 21)
	checker:assert_equal(a, 21)
	checker:assert_equal(b, 43)
	checker:assert_equal(c, 55)
	checker:assert_equal(d, 67)
end


function test_descending(checker)
	a, b, c, d = list.descending(55, 43, 67, 21)
	checker:assert_equal(a, 67)
	checker:assert_equal(b, 55)
	checker:assert_equal(c, 43)
	checker:assert_equal(d, 21)
end

--other functions will not
function sum(a, b)
	return a + b
end

function test_first(checker)
	a = sum(list.first(55, 43, 67), 1)
	checker:assert_equal(a, 56)
end

checker:run_global("list_test")
