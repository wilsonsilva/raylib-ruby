# frozen_string_literal: true

require 'raylib/version'
require 'ffi'

module Raylib
  extend FFI::Library

  ffi_lib 'raylib'
end

require 'raylib/core'
