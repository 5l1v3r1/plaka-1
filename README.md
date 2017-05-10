# README.md
---

bir ilin plaka kodunu ya da plaka kodundan adını bulan yardımcı uygulama

# NOTLAR

```ruby
plaka = Plaka.new

plaka.show(39)
=> "Kırklareli"

plaka.show('kırklareli')
=> 39

plaka.list
=> tüm kodları listele

girilen plaka kodu integer veya string cinsinden olabilir

puts "plaka.show(1) => #{plaka.show(1)}"
puts "plaka.show('1') => #{plaka.show('1')}"

# NOTES

codes = {'1'  => 'adana'}
codes.fetch('1')
=> "adana"

codes.key('adana')
=> "1"

plaka.show('KİLİS')
=> 79

plaka.show('ÇAnkırı')
=> 18

```


