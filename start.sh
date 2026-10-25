#!/system/bin/sh
# Vulpes test sunucusu: Python gerekmez, sadece telefonun kendi kabuğuyla çalışır.

echo "=========================================="
echo "  Merhaba! Vulpes test sunucusu çalışıyor"
echo "=========================================="
echo "Tarih     : $(date)"
echo "Mimari    : $(uname -m)"
echo "Klasör    : $(pwd)"
echo "Dosyalar  : $(ls | tr '\n' ' ')"
echo "HOME      : $HOME"
echo "PREFIX    : $PREFIX"

# Ortam değişkenleri alanına MESAJ=Selam yazarsan burada görünür
if [ -n "$MESAJ" ]; then
  echo "MESAJ     : $MESAJ"
fi

SURE=${SURE:-60}
echo ""
echo "Her 2 saniyede bir yazacağım, toplam $SURE kez."
echo "Deneme: interneti kapat, sunucu 'Bekletildi' olmalı. Aç, kaldığı yerden devam etmeli."
echo ""

i=1
while [ "$i" -le "$SURE" ]; do
  echo "[$i/$SURE] çalışıyorum… $(date +%H:%M:%S)"

  # Ortam değişkenlerine HATA_TEST=1 yazarsan 10. adımda Hatalar sekmesine bir hata düşer
  if [ "$i" -eq 10 ] && [ -n "$HATA_TEST" ]; then
    echo "Error: bu bir deneme hatasıdır (HATA_TEST açık)" >&2
  fi

  i=$((i+1))
  sleep 2
done

echo ""
echo "Bitti. Teşekkürler!"
