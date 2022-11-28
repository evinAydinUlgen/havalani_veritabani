# havalani_veritabani
 ## 1.PROJENİN TANIMI
Bugün tüm dünyada en konforlu ve hızlı bir şekilde seyahat etmenin yollarından biri ve en 
önemlisi Havayolu seyahatidir.Günümüzde havayolu firmalarının bir kısmı iç hatlarda 
ulaşımı sağlarken bir kısmı da hem iç hatlar hem dış hatlar arasında seyahat kolaylığı 
sağlar.Aynı zamanda da bazı havayolları sadece insanların seyahatini gerçekleştirmekle 
kalmayıp şehirler arası hatta ülkeler arası kargo taşımacılığını da sağlamaktadır.Ben bu 
projemde yolcuların seyahat öncesi sonrası veya seyahat sırasındaki bilgilerini bir veri 
tabanına kaydedeceğim.Böylece uçuşdan önce veya sonra yaşanabilecek aksaklıkları 
ortadan kaldırmış olacağım ve bu kayıtların bilgisi de uzun süre veritabanında 
saklanacaktır.
## 2.GEREKSİNİM ANALİZİ
Projeme başlamadan önce havayollarının giriş çıkışlarına dair raporlarını araştırdım ve hem 
havayolu şirketinin hem de yolcuların ne gibi bilgilere sahip olması gerektiğini 
çözümledim.Bunları bir gereksinim listesinde sıraladım.Bu listede ana varlıklar ve 
öznitelikleri belirledikten sonra varlıklar arasındaki iş kurallarını ve ilişkilerini belirledim.En 
sonda primary key ve foreign key’lerimi de işaretleyip sırasıyla Chen Modeli, Kazayağı 
Modeli ve İlişkisel Şemamı oluşturdum.
## 3.İŞ KURALLARI
-Bir yolcunun kestiği biletlerde ad,soyad,kimlik numarası,telefon no gibi kayıtlar 
saklanacaktır.

-Kesilen biletlerde yapılacak seyahate ilişkin uçuş ve uçak id’leri bellidir.Biletin rezerve 
edildiği tarih ve hangi seyahat acentesinden rezerve edildiği kayıt altın alınmalıdır.

-Firmanın filosunda bulunan her uçak bir kod numarası ile kayıtlıdır. Ayrıca bu uçağa ait 
marka, model, yolcu kapasitesi ve menzil bilgileri de saklanmaktadır. Bütün uçaklar aktif 
olarak kullanılmamakta, bazılar bakım/onarım altında olabilmektedir.

-Her uçuşun bir numarası vardır. Bu uçuşa ait kalkış ve varış noktaları ve kalkış kapısı,varış 
kapısı bellidir. Ayrıca bu uçuşun tarihi ve saati ile hangi uçak tarafından gerçekleştirileceği 
bellidir.

-Her uçuşta yolcuların istekler,can sağlığı ve güvenliğinden sorumlu bir mürettebat ekibi 
sorumludur.Bu ekip çalışanlarının ekip kodlarıyla beraber isim, soyisim ve işe başlangıç 
tarihleri gibi birçok kişisel bilgileri de veri tabanında tutulacaktır.

-Bir yolcu birden fazla bilet satın alabilir.Bir bileti yalnızca bir yolcu satın 
alabilir.(Passenger-Reservation(1-N) )

-Bir yolcu farklı zamanlarda farklı birçok uçuşa sahip olabilir.Bir uçuşta birden fazla yolcu 
seyahat edebilir.(Passenger-Flight(M-N) )

-Bir yolcu aynı zaman içerisinde yalnızca bir uçağa binebilir.Bir uçağa birden çok yolcu 
binebilir.(Passenger-Plane(1-N) )

-Bir yolcudan mürettebat ekibindeki birden çok kişi sorumludur.Mürettebat birden çok 
kişiden sorumludur.(Passenger-Crew(M-N) )

-Bir bilet tek uçuşa sahip olacaktır.Bir uçuş için bir bilet geçerlidir.(Reservation-Flight(1-1) )

-Bir uçak birden fazla uçuş yapabilir. Bir uçak bazı uçuşlarda kullanılmayabilir. Bir uçuşa ait 
mutlaka bir uçak vardır.(Plane-Flight(1-N) )

-Bir uçağı belirli bir mürettebat ekibi hazırlar.Bir ekip birden fazla uçağı 
hazırlayabilir.(Plane-Crew(N-1) )

-Bir havalimanında birden fazla çalışan olabilir.Bir çalışan yalnızca bir havalimanında 
çalışmalıdır.(Airport-Worker(1-N))

