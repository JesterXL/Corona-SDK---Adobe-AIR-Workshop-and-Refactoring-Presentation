function getAdjustedPoint(x, y)
	return x, y - 40
end

resultX, resultY = getAdjustedPoint(100, 100)
print(resultX, resultY)

result, err = pcall(moo)
assert(moo(), "Dude, it didn't work")
print("result: ", result, ", err: ", err)

--try/catch