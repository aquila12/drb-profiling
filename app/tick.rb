# Copyright 2022 Nick Moriarty
#
# This file is provided under the terms of the Eclipse Public License, the full
# text of which can be found in EPL-2.0.txt in the licenses directory of this
# repository.

$p = {}

SCALE = 10000

def nothing
  n = SCALE
  while((n -= 1) > 0)
  end
end

def addition
  n = 0
  total = 0
  while(n < SCALE)
    n += 1
    total += n
    total += n
    total += n
    total += n
    total += n
    total += n
    total += n
    total += n
    total += n
    total += n
  end
end

def multiplication
  n = 0
  total = 0
  while(n < SCALE)
    n += 1
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
  end
end

def float_mult
  n = 0.5
  total = 0.0
  while(n < SCALE)
    n += 1.0
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
    total += n*n
  end
end

def string_concat
  n = 0
  str = ""
  while(n < SCALE)
    n += 1
    str += "a"
    str += "a"
    str += "a"
    str += "a"
    str += "a"
    str += "a"
    str += "a"
    str += "a"
    str += "a"
    str += "a"
    str = "a"
  end
end

def a_method
  ""
end

def method_call
  n = 0
  while(n < SCALE)
    n += 1
    a_method
    a_method
    a_method
    a_method
    a_method
    a_method
    a_method
    a_method
    a_method
    a_method
  end
end

class K
  def initialize
    @foo = rand(6).to_i
  end

  def bar
    # Nothing
  end
end

def object_method
  foo = K.new
  n = 0
  while(n < SCALE)
    n += 1
    foo.bar
    foo.bar
    foo.bar
    foo.bar
    foo.bar
    foo.bar
    foo.bar
    foo.bar
    foo.bar
    foo.bar
  end
end

def array_lookup
  n = 0
  while(n < SCALE)
    $a[n]
    $a[n]
    $a[n]
    $a[n]
    $a[n]
    $a[n]
    $a[n]
    $a[n]
    $a[n]
    $a[n]
    n += 1
  end
end

def array_update
  n = 0
  while(n < SCALE)
    $a[n] += n
    $a[n] += n
    $a[n] += n
    $a[n] += n
    $a[n] += n
    $a[n] += n
    $a[n] += n
    $a[n] += n
    $a[n] += n
    $a[n] = n
    n += 1
  end
end

def array_method
  n = 0
  while(n < SCALE)
    $a.x
    $a.y
    $a.w
    $a.h
    $a.x
    $a.y
    $a.w
    $a.h
    $a.length
    $a.first
    n += 1
  end
end

def hash_lookup
  n = 0
  while(n < SCALE)
    $h[:a]
    $h[:b]
    $h[:c]
    $h[:d]
    $h[:e]
    $h[:f]
    $h[:g]
    $h[:h]
    $h[:i]
    $h[:j]
    n += 1
  end
end

def hash_update
  n = 0
  while(n < SCALE)
    $h[:a] += n
    $h[:b] += n
    $h[:c] += n
    $h[:d] += n
    $h[:e] += n
    $h[:f] += n
    $h[:g] += n
    $h[:h] += n
    $h[:i] += n
    $h[:j] += n
    n += 1
  end
end

def hash_method
  n = 0
  while(n < SCALE)
    $h.a
    $h.b
    $h.c
    $h.d
    $h.e
    $h.f
    $h.g
    $h.h
    $h.i
    $h.j
    n += 1
  end
end

def block_call
  a = 0
  b = proc { a += 1 }
  n = 0
  while(n < SCALE)
    b.call
    b.call
    b.call
    b.call
    b.call
    b.call
    b.call
    b.call
    b.call
    b.call
    n += 1
  end
end

def divmod
  n = 0
  while(n < SCALE)
    x, y = n.divmod(3)
    x, y = n.divmod(5)
    x, y = n.divmod(7)
    x, y = n.divmod(11)
    x, y = n.divmod(13)
    x, y = n.divmod(17)
    x, y = n.divmod(19)
    x, y = n.divmod(23)
    x, y = n.divmod(29)
    x, y = n.divmod(31)
    n += 1
  end
end

def lut
  n = 0
  while(n < SCALE)
    x, y = LUT[3]
    x, y = LUT[5]
    x, y = LUT[7]
    x, y = LUT[11]
    x, y = LUT[13]
    x, y = LUT[17]
    x, y = LUT[19]
    x, y = LUT[23]
    x, y = LUT[29]
    x, y = LUT[31]
    n += 1
  end
end

def parallel
  n = 0
  q = 0
  while(n < SCALE)
    a,b,c,d,e,f,g,h,i,j = [9,8,7,6,5,4,3,2,1,0]
    n += 1
  end
end

def times_loop
  SCALE.times do
    # Nothing
  end
end

def for_loop
  for i in 0..SCALE do
    # Nothing
  end
end

def profile(thing, &block)
  p = $p[thing] ||= Profiler.new(thing.to_s.capitalize, 1000)
  p.profile(&method(thing))
end

UUTS = %i[
  nothing
  addition
  multiplication
  float_mult
  string_concat
  method_call
  object_method
  array_lookup
  array_update
  array_method
  hash_lookup
  hash_update
  hash_method
  block_call
  times_loop
  for_loop
  divmod
  lut
  parallel
]

$a = Array.new(SCALE) { rand() }

LUT = Array.new(32) { |i| i.divmod(7) }

$h = {
  a: 1,
  b: 2,
  c: 3,
  d: 4,
  e: 5,
  f: 6,
  g: 7,
  h: 8,
  i: 9,
  j: 10
}

$fps = Profiler.new('Frame timer', 60)

def tick(args)
  $fps.profile_between_calls

  $i ||= 0
  profile(UUTS[$i])
  $i += 1
  $i = 0 unless $i < UUTS.length

  args.outputs.labels << { x: 8, y: 720 - 38, text: $fps.report }
  args.outputs.labels << { x: 8, y: 720 - 8, text: Profiler.metaprofiler.report }
  y = 600
  $p
  .sort_by { |k, p| p.avg_time }
  .each do |k, p|
    args.outputs.labels << { x: 8, y: y, text: p.report }
    y -= 30
  end
end
