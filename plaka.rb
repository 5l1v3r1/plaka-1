#!/usr/bin/env ruby

require 'turkish_support'
using TurkishSupport

class Plaka
  def initialize
    @codes = { 
               '1'  => 'adana',          '2' => 'adıyaman',   '3' => 'afyon', 
               '4'  => 'ağrı',          '5'  => 'amasya',     '6' => 'ankara',
               '7'  => 'antalya',       '8'  => 'artvin',     '9' => 'aydın',
               '10' => 'balıkesir',     '11' => 'bilecik',    '12' => 'bingöl',
               '13' => 'bitlis',        '14' => 'bolu',       '15' => 'burdur',
               '16' => 'bursa',         '17' => 'çanakkale',  '18' => 'çankırı',
               '19' => 'çorum',         '20' => 'denizli',    '21' => 'diyarbakır',
               '22' => 'edirne',        '23' => 'elazığ',     '24' => 'erzincan',
               '25' => 'erzurum',       '26' => 'eskişehir',  '27' => 'gaziantep',
               '28' => 'giresun',       '29' => 'gümüşhane',  '30' => 'hakkari',
               '31' => 'hatay',         '32' => 'ısparta',    '33' => 'içel',
               '34' => 'istanbul',      '35' => 'izmir',      '36' => 'kars',
               '37' => 'kastamonu',     '38' => 'kayseri',    '39' => 'kırklareli',
               '40' => 'kırşehir',      '41' => 'kocaeli',    '42' => 'konya',
               '43' => 'kütahya',       '44' => 'malatya',    '45' => 'manisa',
               '46' => 'kahramanmaraş', '47' => 'mardin',     '48' => 'muğla',
               '49' => 'muş',           '50' => 'nevşehir',   '51' => 'niğde',
               '52' => 'ordu',          '53' => 'rize',       '54' => 'sakarya',
               '55' => 'samsun',        '56' => 'siirt',      '57' => 'sinop',
               '58' => 'sivas',         '59' => 'tekirdağ',   '60' => 'tokat',
               '61' => 'trabzon',       '62' => 'tunceli',    '63' => 'şanlıurfa',
               '64' => 'uşak',          '65' => 'van',        '66' => 'yozgat',
               '67' => 'zonguldak',     '68' => 'aksaray',    '69' => 'bayburt',
               '70' => 'karaman',       '71' => 'kırıkkale',  '72' => 'batman',
               '73' => 'şırnak',        '74' => 'bartın',     '75' => 'ardahan',
               '76' => 'ığdır',         '77' => 'yalova',     '78' => 'karabük',
               '79' => 'kilis',         '80' => 'osmaniye',   '81' => 'düzce'
            }
  end

  def list
    @codes
  end

  def show(param = nil)
    param unless param.nil?

    # convert parameter to string to verify whether it is a string or integer
    if param.to_i == 0    # it is a string
      @codes.key(param.downcase).to_i    # return traffic code
    else
      @codes.fetch(param.to_s)  # return name of city
    end
  end
end

plaka = Plaka.new
puts "plaka.show(39)        => #{plaka.show(39)}"
puts "plaka.show('35')      => #{plaka.show('35')}"
puts "plaka.show('kilis')   => #{plaka.show('kilis')}"
puts "plaka.show('KİLİS')   => #{plaka.show('KİLİS')}"
puts "plaka.show('ÇAnkırı') => #{plaka.show('ÇAnkırı')}"

