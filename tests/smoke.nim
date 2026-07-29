import ../src/clay

proc main() =
  let requiredBytes = CLAY.minMemorySize()
  doAssert requiredBytes > 0

  let memory = alloc(requiredBytes)
  defer: dealloc(memory)

  let arena = CLAY.createArenaWithCapacityAndMemory(requiredBytes, memory)
  discard CLAY.initialize(
    arena,
    Clay_Dimensions(width: 640.0, height: 480.0),
    Clay_ErrorHandler(errorHandlerFunction: nil, userData: nil)
  )
  CLAY.beginLayout()
  let commands = CLAY.endLayout(1.0 / 60.0)
  doAssert commands.length >= 0

when isMainModule:
  main()
