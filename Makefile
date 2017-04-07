PROJECT=GraphQLHandler


build:
	@swift build

run: build
	@./.build/debug/$(PROJECT)

