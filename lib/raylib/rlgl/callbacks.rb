module Raylib
  # OpenGL extension functions loader signature (same as GLADloadproc)
  callback :rlglLoadProc, [:pointer], :pointer
end
