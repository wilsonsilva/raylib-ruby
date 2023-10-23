# frozen_string_literal: true

#   reasings - raylib easings library, based on Robert Penner library
#
#   Useful easing functions for values animation
#
#   How to use:
#   The four inputs t,b,c,d are defined as follows:
#   t = current time (in any unit measure, but same unit as duration)
#   b = starting value to interpolate
#   c = the total change in value of b that needs to occur
#   d = total time it should take to complete (duration)
#
#   Example:
#
#   current_time = 0
#   duration = 100
#   start_position_x = 0.0
#   final_position_x = 30.0
#   current_position_x = start_position_x
#
#   while current_position_x < final_position_x
#     current_position_x = Reasings.ease_sine_in(
#       current_time, start_position_x, final_position_x - start_position_x, duration
#     )
#     current_time++
#   end
#
#   Ported to Ruby by Wilson Silva (@wilsonsilva)
#
#   A port of Robert Penner's easing equations to C (http://robertpenner.com/easing/)
#
#   Robert Penner License
#   ---------------------------------------------------------------------------------
#   Open source under the BSD License.
#
#   Copyright (c) 2001 Robert Penner. All rights reserved.
#
#   Redistribution and use in source and binary forms, with or without modification,
#   are permitted provided that the following conditions are met:
#
#       - Redistributions of source code must retain the above copyright notice,
#         this list of conditions and the following disclaimer.
#       - Redistributions in binary form must reproduce the above copyright notice,
#         this list of conditions and the following disclaimer in the documentation
#         and/or other materials provided with the distribution.
#       - Neither the name of the author nor the names of contributors may be used
#         to endorse or promote products derived from this software without specific
#         prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
#   IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
#   INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
#   BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#   OF THE POSSIBILITY OF SUCH DAMAGE.
#   ---------------------------------------------------------------------------------
#
#   Copyright (c) 2015-2023 Ramon Santamaria (@raysan5)
#
#   This software is provided "as-is", without any express or implied warranty. In no event
#   will the authors be held liable for any damages arising from the use of this software.
#
#   Permission is granted to anyone to use this software for any purpose, including commercial
#   applications, and to alter it and redistribute it freely, subject to the following restrictions:
#
#     1. The origin of this software must not be misrepresented; you must not claim that you
#     wrote the original software. If you use this software in a product, an acknowledgment
#     in the product documentation would be appreciated but is not required.
#
#     2. Altered source versions must be plainly marked as such, and must not be misrepresented
#     as being the original software.
#
#     3. This notice may not be removed or altered from any source distribution.
#
module Reasings
  module_function

  # Linear Easing functions

  def ease_linear_none(t, b, c, d)
    (c * t / d) + b
  end

  def ease_linear_in(t, b, c, d)
    (c * t / d) + b
  end

  def ease_linear_out(t, b, c, d)
    (c * t / d) + b
  end

  def ease_linear_in_out(t, b, c, d)
    (c * t / d) + b
  end

  # Sine Easing functions

  def ease_sine_in(t, b, c, d)
    (-c * Math.cos(t / d * (Math / 2))) + c + b
  end

  def ease_sine_out(t, b, c, d)
    (c * Math.sin(t / d * (Math::PI / 2))) + b
  end

  def ease_sine_in_out(t, b, c, d)
    (-c / 2 * (Math.cos(Math::PI * t / d) - 1)) + b
  end

  # Circular Easing functions

  def ease_circ_in(t, b, c, d)
    t /= d
    (-c * (Math.sqrt(1 - (t * t)) - 1)) + b
  end

  def ease_circ_out(t, b, c, d)
    t = (t / d) - 1
    (c * Math.sqrt(1 - (t * t))) + b
  end

  def ease_circ_in_out(t, b, c, d)
    t /= d / 2

    return ((-c / 2 * (Math.sqrt(1 - (t * t)) - 1)) + b) if t < 1

    t -= 2
    (c / 2 * (Math.sqrt(1 - (t * t)) + 1)) + b
  end

  # Cubic Easing functions

  def ease_cubic_in(t, b, c, d)
    t /= d
    (c * t * t * t) + b
  end

  def ease_cubic_out(t, b, c, d)
    t = (t / d) - 1
    (c * ((t * t * t) + 1)) + b
  end

  def ease_cubic_in_out(t, b, c, d)
    t /= d / 2

    return ((c / 2 * t * t * t) + b) if t < 1

    t -= 2
    (c / 2 * ((t * t * t) + 2)) + b
  end

  # Quadratic Easing functions

  def ease_quad_in(t, b, c, d)
    t /= d
    (c * t * t) + b
  end

  def ease_quad_out(t, b, c, d)
    t /= d
    (-c * t * (t - 2)) + b
  end

  def ease_quad_in_out(t, b, c, d)
    t /= d / 2

    return ((c / 2 * t * t) + b) if t < 1

    (-c / 2 * (((t - 1) * (t - 3)) - 1)) + b
  end

  # Exponential Easing functions

  def ease_expo_in(t, b, c, d)
    return b if t.zero?

    (c * Math.exp(10 * ((t / d) - 1))) + b
  end

  def ease_expo_out(t, b, c, d)
    return b + c if t == d

    (c * (-Math.exp(-10 * t / d) + 1)) + b
  end

  def ease_expo_in_out(t, b, c, d)
    return b if t.zero?
    return b + c if t == d

    t /= d / 2

    return ((c / 2 * Math.exp(10 * (t - 1))) + b) if t < 1

    (c / 2 * (-Math.exp(-10 * (t - 1)) + 2)) + b
  end

  # Back Easing functions

  def ease_back_in(t, b, c, d)
    s = 1.70158
    post_fix = t /= d
    (c * post_fix * t * (((s + 1) * t) - s)) + b
  end

  def ease_back_out(t, b, c, d)
    s = 1.70158
    t = (t / d) - 1
    (c * ((t * t * (((s + 1) * t) + s)) + 1)) + b
  end

  def ease_back_in_out(t, b, c, d)
    s = 1.70158
    t /= d / 2

    if t < 1
      s *= 1.525
      return ((c / 2 * (t * t * (((s + 1) * t) - s))) + b)
    end

    post_fix = t -= 2
    s *= 1.525
    (c / 2 * ((post_fix * t * (((s + 1) * t) + s)) + 2)) + b
  end

  # Bounce Easing functions

  def ease_bounce_out(t, b, c, d)
    if (t /= d) < (1 / 2.75)
      (c * (7.5625 * t * t)) + b
    elsif t < (2 / 2.75)
      post_fix = t -= (1.5 / 2.75)
      (c * ((7.5625 * post_fix * t) + 0.75)) + b
    elsif t < (2.5 / 2.75)
      post_fix = t -= (2.25 / 2.75)
      (c * ((7.5625 * post_fix * t) + 0.9375)) + b
    else
      post_fix = t -= (2.625 / 2.75)
      (c * ((7.5625 * post_fix * t) + 0.984375)) + b
    end
  end

  def ease_bounce_in(t, b, c, d)
    c - ease_bounce_out(d - t, 0, c, d) + b
  end

  def ease_bounce_in_out(t, b, c, d)
    if t < d / 2
      (ease_bounce_in(t * 2, 0, c, d) * 0.5) + b
    else
      (ease_bounce_out((t * 2) - d, 0, c, d) * 0.5) + (c * 0.5) + b
    end
  end

  # Elastic Easing functions

  def ease_elastic_in(t, b, c, d)
    return b if t.zero?
    return b + c if (t /= d) == 1

    p = d * 0.3
    a = c
    s = p / 4.0
    post_fix = a * (2**(10 * (t -= 1)))

    -(post_fix * Math.sin(((t * d) - s) * (2 * Math::PI) / p)) + b
  end

  def ease_elastic_out(t, b, c, d)
    return b if t.zero?
    return b + c if (t /= d) == 1

    p = d * 0.3
    a = c
    s = p / 4.0

    (a * (2**(-10 * t)) * Math.sin(((t * d) - s) * (2 * Math::PI) / p)) + c + b
  end

  def ease_elastic_in_out(t, b, c, d)
    return b if t.zero?
    return b + c if (t /= d / 2) == 2

    p = d * (0.3 * 1.5)
    a = c
    s = p / 4.0

    if t < 1
      post_fix = a * (2**(10 * (t -= 1)))
      (-0.5 * (post_fix * Math.sin(((t * d) - s) * (2 * Math::PI) / p))) + b
    else
      post_fix = a * (2**(-10 * (t -= 1)))
      (post_fix * Math.sin(((t * d) - s) * (2 * Math::PI) / p) * 0.5) + c + b
    end
  end
end
