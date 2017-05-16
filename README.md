# README.md
---

bir ilin plaka kodunu ya da plaka kodundan adını bulan yardımcı uygulama

# importing module

```ruby
require './plaka'

plaka = Plaka.new
puts plaka.show('antalya')
```


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

plaka.show('adana')
=> "1"

plaka.show('KİLİS')
=> 79

plaka.show('ÇAnkırı')
=> 18

```


