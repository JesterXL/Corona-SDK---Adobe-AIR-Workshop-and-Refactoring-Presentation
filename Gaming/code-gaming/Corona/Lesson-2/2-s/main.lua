function ubersum(...)
	local total = 0
	local i = 1
	while arg[i] do
		total = total + arg[i]
		i = i + 1
	end
	return total	
end

print(ubersum(1, 1))
print(ubersum(2, 2))
print(ubersum(1, 1, 1))
print(ubersum(1, 2, 3, 5, 8, 13, 21))