print("foo: ", foo)
foo = "bar"
print("foo: ", foo)
print("_G: ", _G)
print("_G.foo: ", _G.foo)
foo = nil
print("foo: ", foo, ", _G.foo: ", _G.foo)