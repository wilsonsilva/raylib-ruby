module Raylib
  # Logging: Redirect trace log messages
  callback :TraceLogCallback, [:int, :pointer, :pointer], :void

  # FileIO: Load binary data
  callback :LoadFileDataCallback, [:pointer, :pointer], :pointer

  # FileIO: Save binary data
  callback :SaveFileDataCallback, [:pointer, :pointer, :uint], :bool

  # FileIO: Load text data
  callback :LoadFileTextCallback, [:pointer], :pointer

  # FileIO: Save text data
  callback :SaveFileTextCallback, [:pointer, :pointer], :bool

  # TODO
  callback :AudioCallback, [:pointer, :uint], :void
end
