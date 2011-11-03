Cow = {}
Cow.name = "Cow"

function Cow:sayName2()
	print("self: ", self, ", self.name: ", self.name)
end

Cow:sayName2()
