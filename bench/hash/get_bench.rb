require 'benchmark/ips'

require 'immutable/hash'

Benchmark.ips do |b|
  sml_hash = Immutable::Hash[1 => 1]
  med_hash = Immutable::Hash.empty
  1_000.times { |i| med_hash = med_hash.put(i, i) }
  lrg_hash = Immutable::Hash.empty
  1_000_000.times { |i| lrg_hash = lrg_hash.put(i, i) }

  b.report 'get existing small' do |n|
    a = 0
    x = 0
    while a < n
      x = sml_hash.get(a)
      a += 1
    end
  end

  b.report 'get existing medium' do |n|
    a = 0
    x = nil
    while a < n
      x = med_hash.get(a)
      a += 1
    end
  end

  b.report 'get existing large' do |n|
    a = 0
    x = nil
    while a < n
      x = lrg_hash.get(a)
      a += 1
    end
  end

  b.report 'get missing small' do |n|
    a = 0
    x = 0
    while a < n
      x = sml_hash.get(-1)
      a += 1
    end
  end

  b.report 'get missing medium' do |n|
    a = 0
    x = nil
    while a < n
      x = med_hash.get(-1)
      a += 1
    end
  end

  b.report 'get missing large' do |n|
    a = 0
    x = nil
    while a < n
      x = lrg_hash.get(-1)
      a += 1
    end
  end
end
