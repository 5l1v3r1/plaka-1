#!/usr/bin/env ruby

require 'turkish_support'
using TurkishSupport

class Plaka
  def initialize
    @codes = { 
               '1'  => 'adana',          '2' => 'adıyaman',   '3' => ['afyon', 'afyonkarahisar'], 
               '4'  => 'ağrı',          '5'  => 'amasya',     '6' => 'ankara',
               '7'  => 'antalya',       '8'  => 'artvin',     '9' => 'aydın',
               '10' => 'balıkesir',     '11' => 'bilecik',    '12' => 'bingöl',
               '13' => 'bitlis',        '14' => 'bolu',       '15' => 'burdur',
               '16' => 'bursa',         '17' => 'çanakkale',  '18' => 'çankırı',
               '19' => 'çorum',         '20' => 'denizli',    '21' => 'diyarbakır',
               '22' => 'edirne',        '23' => 'elazığ',     '24' => 'erzincan',
               '25' => 'erzurum',       '26' => 'eskişehir',  '27' => 'gaziantep',
               '28' => 'giresun',       '29' => 'gümüşhane',  '30' => 'hakkari',
               '31' => 'hatay',         '32' => 'ısparta',    '33' => ['mersin', 'içel'],
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
      # check first...
      if @codes.key(param.downcase).nil?
        # city may have multiple names like İçel/Mersin
        @codes.each_with_index do |i, index|
          if (i[1].is_a? Array) && (i[1].include?(param.downcase))
            return i[0].to_i 
          end
        end
      else
        @codes.key(param.downcase).to_i    # return traffic code
      end
    else
      if @codes.fetch(param.to_s).is_a? Array
        @codes.fetch(param.to_s).first
      else
        @codes.fetch(param.to_s)  # return name of city  
      end
    end
  end

  def has_many_names(param = nil)
    return false unless self.valid?(param)

    # TO DO: 
  end

  def valid?(param = nil)
    # validate format of city code or city text
    # do not verify for the existence of the cit code/city
    return false if param.nil?

    # integer check
    if param.is_a? Integer
      # 0         => false
      # integers  => true
      param == 0 ? (return false) : (return true)
    end

    # string check
    if (param.is_a? String)
      return false if param.strip.empty?      # plaka.valid(' ') and plaka.valid('') => false
      return true  if param.to_i > 0
      true
    end
  end

  def exists?(param = nil)
    return false unless self.valid?(param)

    # find integer(city_code)
    return self.list.include?(param.to_s) if param.is_a? Integer

    # integer as string check ('33') => true ('0') => false, ('9999') => false
    return self.list.include?(param.to_s) if (param.is_a? String) && (param.to_i > 0)

    # param is found in the hash key plaka.exists?('antalya') => true
    return true unless (param.is_a? String) && (param.to_i == 0) && (self.list.key(param.downcase).nil?)

    # param is NOT found in the hash key, search arrays of each hash key
    if (param.is_a? String) && (param.to_i == 0) && (@codes.key(param.downcase).nil?)
      @codes.each_with_index do |i, index|
        if (i[1].is_a? Array) && (i[1].include?(param.downcase))
          return ((i[0].to_i).is_a? Integer)
        end

      end
      # param is not found in the arrays of each hash key! 
      false
    end
  end
end

plaka = Plaka.new
# puts "plaka.show(39)           => #{plaka.show(39)}"
# puts "plaka.show('35')         => #{plaka.show('35')}"
# puts "plaka.show('kilis')      => #{plaka.show('kilis')}"
# puts "plaka.show('KİLİS')      => #{plaka.show('KİLİS')}"
# puts "plaka.show('ÇAnkırı')    => #{plaka.show('ÇAnkırı')}"
# puts "plaka.show(33)           => #{plaka.show(33)}"
# puts "plaka.show(3)            => #{plaka.show(3)}"
# puts "plaka.show('mersin')     => #{plaka.show('mersin')}"
# puts "plaka.show('içel')       => #{plaka.show('içel')}"

# puts "plaka.show('kamil')      => #{plaka.show('kamil')}"
# puts "plaka.show(99)           => #{plaka.show(99)}"

# puts "plaka.valid?()           => #{plaka.valid?()}"
# puts "plaka.valid?(0)          => #{plaka.valid?(0)}"
# puts "plaka.valid?(39)         => #{plaka.valid?(39)}"
# puts "plaka.valid?('')         => #{plaka.valid?('')}"
# puts "plaka.valid?('39')       => #{plaka.valid?('39')}"
# puts "plaka.valid?('antalya')  => #{plaka.valid?('antalya')}"
# puts "plaka.valid?(' ')        => #{plaka.valid?(' ')}"

puts "plaka.exists?('33')      => #{plaka.exists?('33')}"
puts "plaka.exists?('0')       => #{plaka.exists?('0')}"
puts "plaka.exists?('antalya') => #{plaka.exists?('antalya')}"
puts "plaka.exists?('mersin')  => #{plaka.exists?('mersin')}"
puts "plaka.exists?('içel')    => #{plaka.exists?('içel')}"
puts "plaka.exists?('isviçre') => #{plaka.exists?('isviçre')}"
puts "plaka.exists?(0)         => #{plaka.exists?(0)}"
puts "plaka.exists?(33)        => #{plaka.exists?(33)}"
puts "plaka.exists?(99)        => #{plaka.exists?(99)}"
